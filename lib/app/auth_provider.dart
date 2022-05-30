import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/graphql/login.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/send_verification_code.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/signup.query.graphql.dart';
import 'package:hassah_book_flutter/models/auth_response.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';

const _kTokenRefreshPeriod = Duration(minutes: 3);

class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.client, bool isAuthenticated = false})
      : this._isAuthenticated = isAuthenticated {
    refresh().then((resp) {
      if (_isAuthenticated) {
        _initTimer();
      }
    });
  }

  final GraphQLClient client;

  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Timer? _timer;

  void _initTimer() {
    if (!(_timer?.isActive ?? false)) {
      _timer = Timer.periodic(_kTokenRefreshPeriod, (timer) {
        refresh();
      });
    }
  }

  void _cancelTimer() {
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
    }
  }

  /// sendVerificationCode sends a code using the provided phone number and returns the session info to be used when
  /// verifying the received code.
  Future<String> sendVerificationCode(
      Input$SendVerificationCodeInput input) async {
    _isLoading = true;
    notifyListeners();

    final result = await client.mutate(
      Options$Mutation$SendVerificationCode(
        variables: Variables$Mutation$SendVerificationCode(data: input),
      ),
    );
    if (result.hasException) {
      _isLoading = false;
      notifyListeners();
      throw result.exception!;
    }

    _isLoading = false;
    notifyListeners();

    return result.parsedData!.sendVerificationCode.sessionInfo;
  }

  Future<void> signup(Input$RegisterInput input) async {
    _isLoading = true;
    notifyListeners();

    final result = await client.mutate(
      Options$Mutation$Signup(
        variables: Variables$Mutation$Signup(data: input),
      ),
    );
    if (result.hasException) {
      _isLoading = false;
      notifyListeners();
      throw result.exception!;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> login({required String phone, required String password}) async {
    _initTimer();
    _isLoading = true;
    notifyListeners();

    final input = Input$LoginInput(phone: phone, password: password);

    final result = await client.mutate(
      Options$Mutation$Login(variables: Variables$Mutation$Login(data: input)),
    );
    if (result.hasException) {
      _isAuthenticated = false;
      _isLoading = false;
      notifyListeners();
      throw result.exception!;
    }

    final data = result.parsedData!.login;
    await Auth.storeToken(
      accessToken: data.accessToken,
      refreshToken: data.refreshToken,
    );

    _isAuthenticated = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _cancelTimer();

    _isLoading = true;
    notifyListeners();

    await Auth.removeToken();

    _isAuthenticated = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<AuthResponse?> refresh() async {
    _isLoading = true;
    notifyListeners();

    try {
      final resp = await Auth.refreshTokens();
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return resp;
    } on AuthException {
      _isAuthenticated = false;
      _isLoading = false;
      notifyListeners();
    }
    return null;
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }
}
