import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constant/app_color.dart';

class NavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(8),
            SizedBox(
              height: 23,
              width: 23,
              child: SvgPicture.asset(
                iconPath,
                colorFilter: isActive
                    ? ColorFilter.mode(Theme.of(context).primaryColor, BlendMode.srcIn)
                    : const ColorFilter.mode(AppColor.lightGrey, BlendMode.srcIn),
              ),
            ),
            const Gap(4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isActive ? Theme.of(context).primaryColor : AppColor.lightGrey,
                  ),
            ),
            Gap(MediaQuery.of(context).viewPadding.bottom + 4)
          ],
        ),
      ),
    );
  }
}
