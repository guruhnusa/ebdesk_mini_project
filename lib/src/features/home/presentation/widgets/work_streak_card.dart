import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/assets/assets.gen.dart';
import '../../../../core/utils/constant/app_color.dart';

class WorkStreakCard extends StatelessWidget {
  const WorkStreakCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.work_streaks,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
              ),
        ),
        const Gap(16),
        Row(
          children: [
            SizedBox(
              height: 53,
              width: 53,
              child: Image.asset(
                Assets.images.reward.path,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.longest_current,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : AppColor.dark,
                      ),
                ),
                const Gap(4),
                Row(
                  children: [
                    Text(
                      '29',
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
                          ),
                    ),
                    const Gap(4),
                    Text(
                      AppLocalizations.of(context)!.days,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color:
                                Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : AppColor.dark,
                          ),
                    ),
                  ],
                ),
                const Gap(4),
                Text(
                  '28 Jul 2024 - ${AppLocalizations.of(context)!.today}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : AppColor.dark,
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
