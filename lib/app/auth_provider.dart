import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;

  get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    notifyListeners();
  }
}
