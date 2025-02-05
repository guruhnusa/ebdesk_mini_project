import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/utils/constant/app_color.dart';
import '../widgets/circular_insight_indicator.dart';
import '../widgets/heatmap.dart';
import '../widgets/work_streak_card.dart';

class InsightPage extends StatelessWidget {
  const InsightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.insight,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: ListView(
          children: [
            _smallDivider(context),
            const Gap(16),
            Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.insight_data,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            const Gap(12),
            Divider(
              color: Theme.of(context).brightness == Brightness.light ? AppColor.grey : const Color(0XFF121212),
              thickness: 1,
            ),
            const Gap(20),
            const CircularInsightIndicator(
              value: '50',
            ),
            const Gap(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: WorkStreakCard(),
            ),
            const Gap(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.year_view,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
                        ),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _statusTracked(
                        context: context,
                        title: AppLocalizations.of(context)!.tracked,
                        color: AppColor.blue,
                      ),
                      const Gap(16),
                      _statusTracked(
                        context: context,
                        title: AppLocalizations.of(context)!.untracked,
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color(0xFFF6F6F6)
                            : AppColor.darkModeBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateTime.now().year.toString(),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
                        ),
                  ),
                  const Gap(8),
                  CustomHeatmap(
                    year: DateTime.now().year,
                    datasets: _generateDummyData(DateTime.now().year),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _statusTracked({
    required BuildContext context,
    required String title,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
          ),
        ),
        const Gap(8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
              ),
        ),
      ],
    );
  }

  Center _smallDivider(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light ? const Color(0xFFE2E2E2) : Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

Map<DateTime, int> _generateDummyData(int year) {
  Random random = Random();
  Map<DateTime, int> data = {};
  for (int i = 0; i < 365; i++) {
    DateTime date = DateTime(year, 1, 1).add(Duration(days: i));
    data[date] = random.nextBool() ? 1 : 0;
  }
  return data;
}
