import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/models/auth_response.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({this.client, bool isAuthenticated = false}) : this._isAuthenticated = isAuthenticated;

  GraphQLClient client;

  final _loginMutation = LoginMutation();

  bool _isAuthenticated;
  bool get isAuthenticated => _isAuthenticated;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signup() {
    // TODO: implement signup.
    throw UnimplementedError();
  }

  Future<void> login({@required String phone, @required String password}) async {
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
}
