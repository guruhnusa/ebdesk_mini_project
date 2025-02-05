import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/helper/widgets/choose_menu.dart';
import '../../../../core/utils/constant/app_color.dart';
import '../widgets/login_view.dart';
import '../widgets/sign_up_view.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authSelect = useState<int>(0);

    final pageContoller = usePageController(initialPage: 0);

    final emailController = useTextEditingController();
    final nameController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Text(
                    AppLocalizations.of(context)!.title,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Gap(4),
                  Text(
                    AppLocalizations.of(context)!.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.lightModeGrey,
                        ),
                  ),
                  const Gap(38),
                  Row(
                    children: [
                      ChooseMenu(
                        enable: authSelect.value == 0,
                        title: AppLocalizations.of(context)!.login,
                        action: () {
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
                      ),
                      const Gap(8),
                      ChooseMenu(
                        enable: authSelect.value == 1,
                        title: AppLocalizations.of(context)!.sign_up,
                        action: () {
                          authSelect.value = 1;
                          pageContoller.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );

                          emailController.clear();
                          nameController.clear();
                          passwordController.clear();
                        },
                      ),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
              Expanded(
                child: PageView(
                  controller: pageContoller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    LoginView(
                      emailController: emailController,
                      authSelect: authSelect,
                      pageContoller: pageContoller,
                      passwordController: passwordController,
                    ),
                    SignUpView(
                      emailController: emailController,
                      passwordController: passwordController,
                      nameController: nameController,
                      authSelect: authSelect,
                      pageContoller: pageContoller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
