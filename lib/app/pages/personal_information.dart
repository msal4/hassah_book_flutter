import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hassah_book_flutter/app/widgets/round_container.dart';
import 'package:hassah_book_flutter/common/utils/const.dart';
import 'package:hassah_book_flutter/common/utils/ext.dart';
import 'package:hassah_book_flutter/common/utils/snackbar.dart';
import 'package:hassah_book_flutter/common/widgets/loading_indicator.dart';
import 'package:hassah_book_flutter/common/widgets/retry.dart';
import 'package:hassah_book_flutter/common/widgets/unfocus_on_tap.dart';
import 'package:hassah_book_flutter/graphql/me.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/update_user.query.graphql.dart';
import 'package:hassah_book_flutter/graphql/user.fragment.graphql.dart';
import 'package:hassah_book_flutter/schema.graphql.dart';

class PersonalInformationPage extends HookWidget {
  static const routeName = "/profile/personal_information";

  @override
  Widget build(BuildContext context) {
    return UnfocusOnTap(
      child: Query(
        options: QueryOptions(document: queryDocumentMe),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return const LoadingIndicator();
          }
          if (result.hasException) {
            return Retry(
              message: context.loc!.somethingWentWrong,
              onRetry: refetch,
            );
          }

          final data = Query$Me.fromJson(result.data!);

          return Scaffold(
            appBar: AppBar(title: Text(context.loc!.personalInformation)),
            body: ProfileForm(profile: data.me),
          );
        },
      ),
    );
  }
}

class ProfileForm extends HookWidget {
  ProfileForm({Key? key, required this.profile}) : super(key: key);

  final Fragment$User profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;
    final TextEditingController? nameController =
        useTextEditingController(text: profile.name);
    final TextEditingController? provinceController =
        useTextEditingController(text: profile.province!);
    final TextEditingController? addressController =
        useTextEditingController(text: profile.address!);

    useEffect(() {
      nameController!.text = profile.name;
      provinceController!.text = profile.province!;
      addressController!.text = profile.address!;
      return () {};
    }, [profile.name, profile.province, profile.address]);

    return Mutation(
      options: MutationOptions(document: queryDocumentUpdateProfile),
      builder: (updateProfile, result) {
        return ListView(
          padding: const EdgeInsets.all(kDefaultPadding).copyWith(
            bottom: padding.bottom + kDefaultPadding,
            left: padding.left + kDefaultPadding,
            right: padding.right + kDefaultPadding,
          ),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              child: TextField(
                enabled: result!.isNotLoading,
                controller: nameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding / 1.5,
                  ),
                  border: InputBorder.none,
                  labelText: context.loc!.fullName,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              child: TextField(
                enabled: result.isNotLoading,
                controller: provinceController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding * 1.5,
                      vertical: kDefaultPadding / 1.5),
                  border: InputBorder.none,
                  labelText: context.loc!.province,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            ClipRRect(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              child: TextField(
                enabled: result.isNotLoading,
                controller: addressController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5,
                    vertical: kDefaultPadding / 1.5,
                  ),
                  border: InputBorder.none,
                  labelText: context.loc!.address,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: kDefaultPadding * 2),
            GestureDetector(
              onTap: () async {
                final input = Input$UpdateProfileInput(
                  name: nameController!.text,
                  address: addressController!.text,
                  province: provinceController!.text,
                );

                final res = await updateProfile({"data": input}).networkResult!;
                if (res.hasException) {
                  return showSnackBar(
                    context,
                    message: context.loc!.somethingWentWrong,
                    type: SnackBarType.error,
                  );
                }

                Navigator.pop(context);
              },
              child: RoundContainer(
                borderRadius: BorderRadius.circular(9999),
                padding: const EdgeInsets.all(kDefaultPadding),
                color: result.isNotLoading
                    ? theme.colorScheme.secondary
                    : theme.disabledColor,
                child: Text(
                  context.loc!.apply.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.button!.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
