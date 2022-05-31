import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/auth_provider.dart';
import 'package:hassah_book_flutter/app/pages/signup.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/snackbar.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hassah_book_flutter/main.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';
import 'package:provider/provider.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';

class OTPPage extends HookWidget {
  static const routeName = "/otp";

  const OTPPage({required this.form});

  final SignupForm form;

  @override
  Widget build(context) {
    final theme = Theme.of(context);
    final TextEditingController? otpController = useTextEditingController();
    final isLoading = context.watch<AuthProvider>().isLoading;

    return UnfocusOnTap(
      child: Scaffold(
        appBar: AppBar(
            iconTheme:
                theme.iconTheme.copyWith(color: theme.colorScheme.secondary)),
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
                      Text(context.loc!.appTitle,
                          style: theme.textTheme.headline6),
                    ],
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Text(
                    "${context.loc!.verificationCodeExplanation} ${form.phoneNumber}",
                    style: theme.textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: kDefaultPadding),
                  RoundContainer(
                    color: isLoading ? Colors.grey.shade200 : null,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    child: TextField(
                      enabled: !isLoading,
                      controller: otpController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      style: theme.textTheme.bodyText1!.copyWith(
                          color: isLoading ? Colors.grey.shade600 : null),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: context.loc!.verificationCode,
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultPadding * 2),
                  Material(
                    color: isLoading
                        ? Colors.grey.shade800
                        : theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(9999),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: !isLoading
                          ? () async {
                              final input = Input$RegisterInput(
                                code: otpController!.text,
                                name: form.name,
                                password: form.password,
                                sessionInfo: form.sessionInfo!,
                              );
                              await context.read<AuthProvider>().signup(input);
                              try {
                                await context.read<AuthProvider>().login(
                                    phone: form.phoneNumber,
                                    password: form.password);
                                Navigator.of(context)
                                    .pushReplacementNamed(MainPage.routeName);
                              } on OperationException {
                                showSnackBar(
                                  context,
                                  message: context.loc!.somethingWentWrong,
                                  type: SnackBarType.error,
                                );
                              }
                            }
                          : null,
                      child: Ink(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding * 1.5,
                            vertical: kDefaultPadding),
                        child: Text(
                          context.loc!.verify.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.button!
                              .copyWith(color: Colors.white),
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
}
