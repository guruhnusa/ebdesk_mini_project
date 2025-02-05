import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/helper/buttons/buttons.dart';
import '../../../../core/helper/text_field/custom_text_field.dart';
import '../../../../core/routers/route_name.dart';
import '../../../../core/utils/constant/app_color.dart';
import '../../../main/presentation/controllers/main_index_provider.dart';

class LoginView extends ConsumerWidget {
  const LoginView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.authSelect,
    required this.pageContoller,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueNotifier<int> authSelect;
  final PageController pageContoller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Text(
          'Email',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(10),
        CustomTextField(
          controller: emailController,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
        ),
        const Gap(16),
        Text(
          AppLocalizations.of(context)!.password,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(10),
        CustomTextField(
          controller: passwordController,
          label: AppLocalizations.of(context)!.password,
          obscureText: true,
        ),
        const Gap(4),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.forgot_password,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.lightModeGrey,
                  ),
            ),
          ),
        ),
        const Gap(28),
        Button.filled(
          onPressed: () {
            ref.invalidate(mainIndexProvider);
            context.pushReplacement(RouteName.main);
          },
          label: AppLocalizations.of(context)!.login,
        ),
        const Gap(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.dont_have_an_account,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.lightModeGrey,
                  ),
            ),
            TextButton(
              onPressed: () {
                authSelect.value = 1;
                pageContoller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                emailController.clear();
                passwordController.clear();
              },
              child: Text(
                AppLocalizations.of(context)!.sign_up,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
