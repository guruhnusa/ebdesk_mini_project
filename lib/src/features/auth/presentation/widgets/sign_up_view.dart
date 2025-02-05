import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/helper/buttons/buttons.dart';
import '../../../../core/helper/text_field/custom_text_field.dart';
import '../../../../core/utils/constant/app_color.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.authSelect,
    required this.pageContoller,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  final ValueNotifier<int> authSelect;
  final PageController pageContoller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          AppLocalizations.of(context)!.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(10),
        CustomTextField(
          controller: nameController,
          label: AppLocalizations.of(context)!.name,
        ),
        const Gap(16),
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
        const Gap(28),
        Button.filled(
          onPressed: () {},
          label: AppLocalizations.of(context)!.register,
        ),
        const Gap(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.already_have_an_account,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColor.lightModeGrey,
                  ),
            ),
            TextButton(
              onPressed: () {
                authSelect.value = 0;
                pageContoller.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
                emailController.clear();
                nameController.clear();
                passwordController.clear();
              },
              child: Text(
                AppLocalizations.of(context)!.sign_in,
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
