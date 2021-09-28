import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/captcha.dart';
import 'package:hassah_book_flutter/app/pages/login.dart';
import 'package:hassah_book_flutter/app/pages/otp.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/api/api.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:provider/provider.dart';

class SignupForm {
  SignupForm({
    @required this.name,
    @required this.phoneNumber,
    @required this.province,
    @required this.address,
    @required this.password,
    this.sessionInfo,
  });

  final String name;
  final String phoneNumber;
  final String province;
  final String address;
  final String password;
  String sessionInfo;
}

class SignupPage extends HookWidget {
  static const routeName = "/signup";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final nameController = useTextEditingController
        .fromValue(TextEditingValue(text: "Mohammed Salman"));
    final phoneController = useTextEditingController
        .fromValue(TextEditingValue(text: "07705983835"));
    final provinceController =
        useTextEditingController.fromValue(TextEditingValue(text: "Baghdad"));
    final addressController = useTextEditingController
        .fromValue(TextEditingValue(text: "123 Street"));
    final passwordController =
        useTextEditingController.fromValue(TextEditingValue(text: "12345678"));

    final isLoading = context.watch<AuthProvider>().isLoading;
    final error = useState("");

    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
            iconTheme: theme.iconTheme.copyWith(color: theme.accentColor)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: IgnorePointer(
            ignoring: isLoading,
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset("assets/svg/icon.svg",
                          width: kAvatarRadius),
                      Text(context.loc.appTitle,
                          style: theme.textTheme.headline6),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding * 2),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      style: theme.textTheme.bodyText1.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/name.svg",
                            width: kDefaultIconSize),
                        border: InputBorder.none,
                        hintText: context.loc.fullName,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: theme.textTheme.bodyText1.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/person.svg",
                            width: kDefaultIconSize),
                        border: InputBorder.none,
                        hintText: context.loc.phoneNumber,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: provinceController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      style: theme.textTheme.bodyText1.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/pin.svg",
                            width: kDefaultIconSize),
                        border: InputBorder.none,
                        hintText: context.loc.province,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: addressController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.streetAddress,
                      style: theme.textTheme.bodyText1.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/building.svg",
                            width: kDefaultIconSize),
                        border: InputBorder.none,
                        hintText: context.loc.address,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      style: theme.textTheme.bodyText1.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      decoration: InputDecoration(
                        icon: SvgPicture.asset("assets/svg/lock.svg",
                            width: kDefaultIconSize, height: kDefaultIconSize),
                        border: InputBorder.none,
                        hintText: context.loc.password,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      error.value,
                      style: theme.textTheme.bodyText1.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  Material(
                    color: isLoading ? Colors.grey.shade800 : theme.accentColor,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: !isLoading
                          ? () => _onSignup(
                                context,
                                SignupForm(
                                  name: nameController.text,
                                  phoneNumber: phoneController.text,
                                  province: provinceController.text,
                                  address: addressController.text,
                                  password: passwordController.text,
                                ),
                                error: error,
                              )
                          : null,
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc.signup.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginPage.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(context.loc.alreadyHaveAnAccount),
                        const SizedBox(width: kDefaultPadding / 2),
                        Text(
                          context.loc.login,
                          style: theme.textTheme.button
                              .copyWith(color: theme.accentColor),
                        ),
                      ],
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

  Future<void> _onSignup(BuildContext context, SignupForm arguments,
      {@required ValueNotifier<String> error}) async {
    void onMessage(String token) async {
      try {
        final input = SendVerificationCodeInput(
            phoneNumber: arguments.phoneNumber, recaptchaToken: token);
        final sessionInfo =
            await context.read<AuthProvider>().sendVerificationCode(input);
        arguments.sessionInfo = sessionInfo;

        Navigator.of(context)
            .pushNamed(OTPPage.routeName, arguments: arguments);
      } on OperationException catch (e) {
        if (e.graphqlErrors
            .any((err) => err.extensions["code"] == "ALREADY_EXISTS")) {
          error.value = context.loc.userWithThisPhoneAlreadyExists;
        } else {
          error.value = context.loc.somethingWentWrong;
        }
      }
    }

    Navigator.of(context).pushNamed(CaptchaPage.routeName,
        arguments: CaptchaPageArguments(onMessage: onMessage));
  }
}
