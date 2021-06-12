import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/dashboard/pages/login.dart';
import 'package:hassah_book_flutter/dashboard/pages/products.dart';

class RootPage extends HookWidget {
  static const routeName = "/";

  Future<void> _initAuth(BuildContext context) async {
    final refreshToken = Auth.getToken(TokenType.Refresh);
    if (refreshToken == null) {
      return _goToLogin(context);
    }
    try {
      await Auth.refreshTokens();
    } on AuthException {
      return _goToLogin(context);
    }
  }

  void _goToLogin(BuildContext context) => Navigator.of(context).pushReplacementNamed(LoginPage.routeName);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      _initAuth(context);
      return;
    }, []);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("this is the root page"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProductsPage.routeName);
              },
              child: Text("Go to products"),
            ),
          ],
        ),
      ),
    );
  }
}
