import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../controllers/main_index_provider.dart';
import '../widgets/nav_item.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(mainIndexProvider);

    final List<Widget> selectedPage = [
      const HomePage(),
      const Center(
        child: Text('Work Log'),
      ),
      const Center(
        child: Text('Analytic'),
      ),
      const ProfilePage(),
    ];

    void onItemTapped(int index) {
      ref.read(mainIndexProvider.notifier).setIndex(index);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: selectedPage[selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.08),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            NavItem(
              iconPath: Assets.icons.dashboard.path,
              label: AppLocalizations.of(context)!.dashboard,
              isActive: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
              },
            ),
            NavItem(
              iconPath: Assets.icons.workLog.path,
              label: AppLocalizations.of(context)!.work_log,
              isActive: selectedIndex == 1,
              onTap: () {
                onItemTapped(1);
              },
            ),
            NavItem(
              iconPath: Assets.icons.analytic.path,
              label: AppLocalizations.of(context)!.analytics,
              isActive: selectedIndex == 2,
              onTap: () {
                onItemTapped(2);
              },
            ),
            NavItem(
              iconPath: Assets.icons.profile.path,
              label: AppLocalizations.of(context)!.profile,
              isActive: selectedIndex == 3,
              onTap: () {
                onItemTapped(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
