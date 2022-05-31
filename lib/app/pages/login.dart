import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/signup.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hassah_book_flutter/main.dart';
import 'package:provider/provider.dart';

final countryCodeRegexp = RegExp(r"^((00|\+)964|0)");
final phoneRegexp = RegExp(r"^\d{10}$");

class LoginPage extends HookWidget {
  static const routeName = "/login";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final phoneErr = useState("");
    final passwordErr = useState("");

    final TextEditingController? phoneController = useTextEditingController();
    final TextEditingController? passwordController =
        useTextEditingController();

    final isLoading = context.watch<AuthProvider>().isLoading;

    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
          iconTheme:
              theme.iconTheme.copyWith(color: theme.colorScheme.secondary),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: IgnorePointer(
            ignoring: isLoading,
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/icon.svg",
                        width: kAvatarRadius,
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      Text(
                        context.loc!.appTitle,
                        style: theme.textTheme.headline6,
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    child: TextField(
                      enabled: !isLoading,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        if (v.isEmpty) {
                          phoneErr.value = context.loc!.phoneNumberIsRequired;
                          return;
                        }

                        if (!countryCodeRegexp.hasMatch(v)) {
                          phoneErr.value = context.loc!.invalidPhoneNumber;
                          return;
                        } else {
                          final phone = v.replaceFirst(countryCodeRegexp, "");
                          if (!phoneRegexp.hasMatch(phone)) {
                            phoneErr.value = context.loc!.invalidPhoneNumber;
                            return;
                          }
                        }

                        if (phoneErr.value.isNotEmpty) {
                          phoneErr.value = "";
                        }
                      },
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: isLoading ? Colors.grey.shade600 : null,
                      ),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset(
                          "assets/svg/person.svg",
                          width: kDefaultIconSize,
                          color: phoneErr.value.isNotEmpty ? Colors.red : null,
                        ),
                        border: InputBorder.none,
                        hintText: context.loc!.phoneNumber,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      phoneErr.value,
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding / 2,
                    ),
                    child: TextField(
                      enabled: !isLoading,
                      controller: passwordController,
                      textInputAction: TextInputAction.go,
                      obscureText: true,
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: isLoading ? Colors.grey.shade600 : null,
                      ),
                      onChanged: (v) {
                        if (passwordErr.value.isNotEmpty) {
                          passwordErr.value = "";
                        }
                      },
                      decoration: InputDecoration(
                        icon: SvgPicture.asset(
                          "assets/svg/lock.svg",
                          width: kDefaultIconSize,
                          color:
                              passwordErr.value.isNotEmpty ? Colors.red : null,
                        ),
                        border: InputBorder.none,
                        hintText: context.loc!.password,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 4),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      passwordErr.value,
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      context.loc!.forgotPassword,
                      style: theme.textTheme.button!
                          .copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: isLoading
                        ? Colors.grey.shade800
                        : theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: !isLoading
                          ? () => _onLogin(
                                context,
                                phone: phoneController!.text,
                                password: passwordController!.text,
                                phoneError: phoneErr,
                                passwordError: passwordErr,
                              )
                          : null,
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc!.login.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignupPage.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.loc!.dontHaveAnAccount),
                        const SizedBox(width: kDefaultPadding / 2),
                        Text(
                          context.loc!.signup.toUpperCase(),
                          style: theme.textTheme.button!.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pushReplacementNamed(
                            MainPage.routeName,
                          );
                        }
                      },
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc!.skip.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button!.copyWith(
                            color: Colors.grey.shade800,
                          ),
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

  Future<void> _onLogin(
    BuildContext context, {
    required String phone,
    required String password,
    required ValueNotifier<String> phoneError,
    required ValueNotifier<String> passwordError,
  }) async {
    try {
      await context
          .read<AuthProvider>()
          .login(phone: phone, password: password);
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushReplacementNamed(MainPage.routeName);
      }
    } on OperationException catch (e) {
      if (e.graphqlErrors
          .any((err) => err.extensions!["code"] == "INVALID_CREDENTIALS")) {
        passwordError.value = context.loc!.invalidCredentials;
      } else if (e.graphqlErrors
          .any((err) => err.extensions!["code"] == "NOT_FOUND")) {
        phoneError.value = context.loc!.phoneNotFound;
      } else {
        passwordError.value = context.loc!.somethingWentWrong;
        phoneError.value = " ";
      }
    }
  }
}
