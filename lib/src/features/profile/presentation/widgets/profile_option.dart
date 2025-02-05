// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileOption extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String icon;
  final Widget suffix;
  final bool hasSuffix;
  const ProfileOption({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    this.suffix = const SizedBox.shrink(),
    this.hasSuffix = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 21,
            width: 21,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black, BlendMode.srcIn),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (hasSuffix) suffix,
        ],
      ),
    );
  }
}
