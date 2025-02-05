// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/utils/constant/app_color.dart';

class CircularInsightIndicator extends StatelessWidget {
  final String value;
  const CircularInsightIndicator({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80,
      percent: int.parse(value) / 100,
      lineWidth: 8.0,
      progressColor: AppColor.blue,
      backgroundColor:
          Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeBlack : AppColor.lightModePurple,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$value%',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Gap(4),
          Text(
            AppLocalizations.of(context)!.month,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : AppColor.dark),
          ),
          Text(
            AppLocalizations.of(context)!.tracked_rate,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : AppColor.dark),
          ),
        ],
      ),
    );
  }
}
