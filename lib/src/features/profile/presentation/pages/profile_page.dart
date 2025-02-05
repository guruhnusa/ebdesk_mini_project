import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../../core/routers/route_name.dart';
import '../../../../core/utils/enum/languange.dart';
import '../../../../core/utils/provider/language_provider.dart';
import '../../../../core/utils/provider/language_repository.dart';
import '../../../../core/utils/provider/theme_provider.dart';
import '../widgets/profile_option.dart';
import '../widgets/profile_user_card.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const ProfileUserCard(),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                AppLocalizations.of(context)!.general,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileOption(
                      icon: Assets.icons.person.path,
                      title: AppLocalizations.of(context)!.profile,
                      onTap: () {
                        context.push(RouteName.profile, extra: AppLocalizations.of(context)!.profile);
                      },
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.data.path,
                      title: AppLocalizations.of(context)!.data_privacy,
                      onTap: () {
                        context.push(RouteName.profile, extra: AppLocalizations.of(context)!.data_privacy);
                      },
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.subscription.path,
                      title: AppLocalizations.of(context)!.subscription,
                      onTap: () {
                        context.push(RouteName.profile, extra: AppLocalizations.of(context)!.subscription);
                      },
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.password.path,
                      title: AppLocalizations.of(context)!.password,
                      onTap: () {
                        context.push(RouteName.profile, extra: AppLocalizations.of(context)!.password);
                      },
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.moon.path,
                      title: AppLocalizations.of(context)!.dark_mode,
                      hasSuffix: true,
                      suffix: SizedBox(
                        height: 21,
                        child: Switch(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          value:  ref.watch(themeSwitchProvider),
                          onChanged: (value) {
                            ref.read(themeSwitchProvider.notifier).state = value;
                          },
                        ),
                      ),
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.flag.path,
                      title: ref.watch(languageProvider.notifier).state.name,
                      hasSuffix: true,
                      suffix: PopupMenuButton(
                        child: const Icon(
                          Icons.more_vert,
                        ),
                        itemBuilder: (context) {
                          return Language.values
                              .map((e) => PopupMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Text(e.flag),
                                        const Gap(8),
                                        Text(e.name),
                                      ],
                                    ),
                                  ))
                              .toList();
                        },
                        onSelected: (Language language) {
                          ref.read(languageRepositoryProvider).setLanguage(language: language);
                        },
                      ),
                    ),
                    _dividerProfile(),
                    ProfileOption(
                      icon: Assets.icons.signout.path,
                      title: AppLocalizations.of(context)!.sign_out,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(AppLocalizations.of(context)!.sign_out),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    context.pushReplacement(RouteName.login);
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)!.yes,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(AppLocalizations.of(context)!.no),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _dividerProfile() {
    return Column(
      children: [
        const Gap(8),
        Divider(
          color: const Color(0xFFD5CFCF).withOpacity(0.19),
          thickness: 0.5,
        ),
        const Gap(10),
      ],
    );
  }
}
