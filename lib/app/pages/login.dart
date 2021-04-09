import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hassah_book_flutter/main.dart';
import 'package:provider/provider.dart';

const _kIconSize = 20.0;

class LoginPage extends HookWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final phoneController = useTextEditingController.fromValue(TextEditingValue(text: "07705983835"));
    final passwordController = useTextEditingController.fromValue(TextEditingValue(text: "12345678"));
    final isLoading = context.watch<AuthProvider>().isLoading;

    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(iconTheme: theme.iconTheme.copyWith(color: theme.accentColor)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: IgnorePointer(
            ignoring: isLoading,
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset("assets/svg/icon.svg", width: kAvatarRadius),
                      Text("Hassah Book", style: theme.textTheme.headline6),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: theme.textTheme.bodyText1.copyWith(color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/person.svg", width: _kIconSize),
                        border: InputBorder.none,
                        hintText: "Phone Number",
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: passwordController,
                      textInputAction: TextInputAction.go,
                      obscureText: true,
                      style: theme.textTheme.bodyText1.copyWith(color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/key.svg", width: _kIconSize),
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Forgot password?", style: theme.textTheme.button.copyWith(color: theme.accentColor)),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: isLoading ? Colors.grey.shade800 : theme.accentColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: !isLoading
                          ? () => _onLogin(
                                context,
                                phone: phoneController.text,
                                password: passwordController.text,
                              )
                          : null,
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        SizedBox(width: kDefaultPadding / 2),
                        Text(
                          "SIGN UP",
                          style: theme.textTheme.button.copyWith(color: theme.accentColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(MainPage.routeName);
                      },
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
                        child: Text(
                          "SKIP",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button.copyWith(color: Colors.grey.shade800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onLogin(BuildContext context, {@required String phone, @required String password}) async {
    try {
      await context.read<AuthProvider>().login(phone: phone, password: password);
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushReplacementNamed(MainPage.routeName);
      }
    } on OperationException catch (e) {
      // TODO: handle errors.
    }
  }
}
