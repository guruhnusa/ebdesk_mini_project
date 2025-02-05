// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utils/constant/app_color.dart';
import 'work_value.dart';

class CircularDashboardProgress extends StatelessWidget {
  const CircularDashboardProgress({
    super.key,
    required this.value,
    required this.label,
    required this.target,
  });

  final String value;
  final String label;
  final String target;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.0,
      arcType: ArcType.values[1],
      arcBackgroundColor:
          Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeBlack : AppColor.lightModePurple,
      lineWidth: 8.0,
      animation: true,
      percent: int.parse(value) / int.parse(target),
      center: WorkValue(value: value.toString(), title: label),
      circularStrokeCap: CircularStrokeCap.square,
      progressColor: AppColor.blue,
    );
  }
}
