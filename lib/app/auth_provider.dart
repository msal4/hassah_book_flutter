import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({@required this.client, bool isAuthenticated = false}) : this._isAuthenticated = isAuthenticated;

  final GraphQLClient client;

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

  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Auth.refreshTokens();
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
    } on AuthException {
      _isAuthenticated = false;
      _isLoading = false;
      notifyListeners();
    }
  }
}
