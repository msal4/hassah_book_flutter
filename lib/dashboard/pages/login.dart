import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/auth/auth.dart';
import 'package:hassah_book_flutter/dashboard/pages/root.dart';

class LoginPage extends HookWidget {
  static const routeName = "/login";
  final _loginMutation = AdminLoginMutation();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: 'ms@ms.ms');
    final passwordController = useTextEditingController(text: '12345678');

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Mutation(
              options: MutationOptions(documentNode: _loginMutation.document),
              builder: (runMutation, result) {
                return Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await runMutation({
                          'data': AdminLoginInput(
                            email: emailController.value.text,
                            password: passwordController.value.text,
                          )
                        }).networkResult;
                        if (result.data != null) {
                          await _storeTokens(result.data);
                          Navigator.of(context)
                              .pushReplacementNamed(RootPage.routeName);
                        } else if (result.exception != null) {
                          // TODO: show validation errors for the user.
                          // doesn't matter for the admin, i'll save the hard
                          // work for the user facing app.
                          print('exception: ${result.exception}');
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future _storeTokens(Map<String, dynamic> result) async {
    final data = _loginMutation.parse(result).adminLogin;
    await Auth.storeToken(
        refreshToken: data.refreshToken, accessToken: data.accessToken);
  }
}
