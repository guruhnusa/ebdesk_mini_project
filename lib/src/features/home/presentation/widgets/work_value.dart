import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constant/app_color.dart';

class WorkValue extends StatelessWidget {
  final String value;
  final String title;
  const WorkValue({
    super.key,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const Gap(4),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).brightness == Brightness.dark ? AppColor.lightModeGrey : AppColor.darkModeGrey,
              ),
        ),
      ],
    );
  }
}
