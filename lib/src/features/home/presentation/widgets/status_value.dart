import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/utils/constant/app_color.dart';

class StatusValue extends StatelessWidget {
  final Color color;
  final String value;
  final String percent;
  final String title;
  const StatusValue({
    super.key,
    required this.color,
    required this.value,
    required this.percent,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.lightModeGrey : AppColor.darkModeGrey,
              ),
        ),
        const Gap(4),
        LinearPercentIndicator(
          width: 100,
          lineHeight: 8.0,
          percent: int.parse(value) / int.parse(percent),
          progressColor: color,
          backgroundColor:
              Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeBlack : AppColor.lightModePurple,
        ),
        const Gap(4),
        Text(
          "$value / $percent %",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
