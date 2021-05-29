import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/models/auth_response.dart';

const _kTokenRefreshPeriod = Duration(minutes: 3);

class AuthProvider extends ChangeNotifier {
  AuthProvider({@required this.client, bool isAuthenticated = false}) : this._isAuthenticated = isAuthenticated {
    refresh().then((resp) {
      if (_isAuthenticated) {
        _initTimer();
      }
    });
  }

  final GraphQLClient client;

  final _loginMutation = LoginMutation();
  final _sendCodeMutation = SendVerificationCodeMutation();
  final _signupMutation = SignupMutation();

  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Timer _timer;

  void _initTimer() {
    if (!(_timer?.isActive ?? false)) {
      _timer = Timer.periodic(_kTokenRefreshPeriod, (timer) {
        refresh();
      });
    }
  }

  void _cancelTimer() {
    if (_timer?.isActive ?? false) {
      _timer.cancel();
    }
  }

  /// sendVerificationCode sends a code using the provided phone number and returns the session info to be used when
  /// verifying the received code.
  Future<String> sendVerificationCode(SendVerificationCodeInput input) async {
    _isLoading = true;
    notifyListeners();

    final result = await client.mutate(MutationOptions(document: _sendCodeMutation.document, variables: {"data": input}));
    if (result.hasException) {
      _isLoading = false;
      notifyListeners();
      throw result.exception;
    }

    _isLoading = false;
    notifyListeners();

    return _sendCodeMutation.parse(result.data).sendVerificationCode.sessionInfo;
  }

  Future<void> signup(RegisterInput input) async {
    _isLoading = true;
    notifyListeners();

    final result = await client.mutate(MutationOptions(document: _signupMutation.document, variables: {"data": input}));
    if (result.hasException) {
      _isLoading = false;
      notifyListeners();
      throw result.exception;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> login({@required String phone, @required String password}) async {
    _initTimer();
    _isLoading = true;
    notifyListeners();

    final input = LoginInput(phone: phone, password: password);

    final result = await client.mutate(MutationOptions(document: _loginMutation.document, variables: {"data": input}));
    if (result.hasException) {
      _isAuthenticated = false;
      _isLoading = false;
      notifyListeners();
      throw result.exception;
    }

    final data = _loginMutation.parse(result.data).login;
    await Auth.storeToken(accessToken: data.accessToken, refreshToken: data.refreshToken);

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

  Future<AuthResponse> refresh() async {
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
