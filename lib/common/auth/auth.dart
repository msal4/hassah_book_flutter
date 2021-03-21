import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hassah_book_flutter/models/auth_response.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum TokenType { Refresh, Access }

extension on TokenType {
  String get value {
    if (this == TokenType.Refresh) {
      return "refresh_token";
    }

    return "access_token";
  }
}

abstract class Auth {
  static final _prefsFuture = SharedPreferences.getInstance();
  static final _client = Client();

  /// Gets the token of the provided type.
  static Future<String> getToken(TokenType tokenType) async {
    final prefs = await _prefsFuture;
    return prefs.getString(tokenType.value);
  }

  /// Stores the provided tokens. Doesn't store null values.
  /// If you want to remove a token use `removeToken`.
  static Future<void> storeToken(
      {String refreshToken, String accessToken}) async {
    final prefs = await _prefsFuture;
    if (refreshToken != null) {
      await prefs.setString(TokenType.Refresh.value, refreshToken);
    }
    if (accessToken != null) {
      await prefs.setString(TokenType.Access.value, accessToken);
    }
  }

  /// Removes all stored tokens if no token type is provided.
  static Future<void> removeToken([TokenType tokenType]) async {
    final prefs = await _prefsFuture;
    if (tokenType == null) {
      await prefs.remove(TokenType.Refresh.value);
      await prefs.remove(TokenType.Access.value);
      return;
    }
    return await prefs.remove(tokenType.value);
  }

  /// Sends a refresh request to the auth endpoint.
  /// Throws an AuthException if the refresh token is invalidated or expired.
  static Future<AuthResponse> refreshTokens() async {
    final refreshToken = await getToken(TokenType.Refresh);
    // TODO: get the url from the environment or a constant.
    final resp = await _client.post(
      "http://localhost:4000/refresh_token",
      body: jsonEncode({"token": refreshToken}),
      headers: {'content-type': 'application/json'},
    );

    if (resp.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(resp.body);
      await storeToken(
        refreshToken: authResponse.refreshToken,
        accessToken: authResponse.accessToken,
      );

      return authResponse;
    } else if (resp.statusCode == 401) {
      await removeToken();
      throw AuthException();
    }

    throw Exception(resp.body);
  }
}

class AuthException implements Exception {}

class AuthClient extends BaseClient {
  final _client = Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    try {
      final resp = await _client.send(request);
      debugPrint('AuthClient: status: ${resp.statusCode}');
      if (resp.statusCode == 401) {
        try {
          final authResp = await Auth.refreshTokens();

          debugPrint("AuthClient: refreshed tokens");

          request.headers["authorization"] = "Bearer ${authResp.accessToken}";
          return _client.send(request);
        } on AuthException {
          debugPrint("AuthClient: failed to refresh tokens");
        }
      }

      return resp;
    } catch (e) {
      debugPrint("AuthClient: failed with error: $e");
    }

    return _client.send(request);
  }

  @override
  void close() {
    _client.close();
    super.close();
  }
}
