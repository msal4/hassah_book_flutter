import 'dart:convert';

class AuthResponse {
  const AuthResponse({required this.refreshToken, required this.accessToken});

  final String? refreshToken;
  final String? accessToken;

  factory AuthResponse.fromJson(String json) {
    return AuthResponse.fromMap(Map<String, dynamic>.from(jsonDecode(json)));
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
        refreshToken: map["refreshToken"], accessToken: map["accessToken"]);
  }

  @override
  String toString() =>
      "AuthResponse {refreshToken: $refreshToken, accessToken: $accessToken}";
}
