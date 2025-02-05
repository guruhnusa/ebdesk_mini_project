import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/extensions/string_ext.dart';
import '../../../../core/helper/widgets/choose_menu.dart';
import '../../../../core/utils/constant/app_color.dart';
import '../../domain/models/work_model.dart';
import 'circular_dashboard_progress.dart';
import 'status_value.dart';
import 'work_value.dart';

class HomeDashboard extends HookConsumerWidget {
  final WorkModel? data;
  const HomeDashboard({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String locale = Localizations.localeOf(context).toLanguageTag();

    final menuSelected = useState(0);

    return Container(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateTime.now().toString().formatToLocale(locale),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color:
                      Theme.of(context).brightness == Brightness.dark ? AppColor.lightModeGrey : AppColor.darkModeGrey,
                ),
          ),
          const Gap(4),
          Text(
            AppLocalizations.of(context)!.dashboard,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Gap(20),
          Text(
            AppLocalizations.of(context)!.work_log_focus,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          const Gap(36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WorkValue(
                  title: AppLocalizations.of(context)!.remaining,
                  value: data?.remaining ?? '0',
                ),
                CircularDashboardProgress(
                  label: AppLocalizations.of(context)!.working,
                  value: data?.working ?? '0',
                  target: data?.target ?? '0',
                ),
                WorkValue(
                  title: AppLocalizations.of(context)!.target,
                  value: data?.target ?? '0',
                ),
              ],
            ),
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatusValue(
                color: AppColor.orange,
                value: data?.failedValue ?? '1',
                percent: data?.failedPercentage ?? '100',
                title: AppLocalizations.of(context)!.failed,
              ),
              StatusValue(
                color: AppColor.yellow,
                value: data?.progressValue ?? '1',
                percent: data?.progressPercentage ?? '100',
                title: AppLocalizations.of(context)!.progress,
              ),
              StatusValue(
                color: AppColor.green,
                value: data?.successValue ?? '1',
                percent: data?.successPercentage ?? '100',
                title: AppLocalizations.of(context)!.success,
              ),
            ],
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChooseMenu(
                enable: menuSelected.value == 0,
                title: AppLocalizations.of(context)!.worked,
                action: () {
                  menuSelected.value = 0;
                },
              ),
              const Gap(4),
              ChooseMenu(
                enable: menuSelected.value == 1,
                title: AppLocalizations.of(context)!.remaining,
                action: () {
                  menuSelected.value = 1;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
