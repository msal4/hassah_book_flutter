import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({@required this.client});

  final GraphQLClient client;

  final _loginMutation = LoginMutation();

  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> signup() {
    // TODO: implement signup.
    throw UnimplementedError();
  }

  Future<void> login({@required String phone, @required String password}) async {
    final input = LoginInput(phone: phone, password: password);

    final result = await client.mutate(MutationOptions(document: _loginMutation.document, variables: {"data": input}));
    if (result.hasException) {
      _isAuthenticated = false;
      throw result.exception;
    }

    final data = _loginMutation.parse(result.data).login;
    await Auth.storeToken(accessToken: data.accessToken, refreshToken: data.refreshToken);

    _isAuthenticated = true;
    notifyListeners();
  }

  Future<void> logout() async {
    await Auth.removeToken();
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    try {
      await Auth.refreshTokens();
    } on AuthException {
      _isAuthenticated = false;
      notifyListeners();
    }
  }
}
