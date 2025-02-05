import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/extensions/string_ext.dart';
import '../../../../core/utils/constant/app_color.dart';

class ProfileUserCard extends StatelessWidget {
  const ProfileUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const name = 'Samuel Adewale';

    const date = '21 August 2024';

    String formatDate(BuildContext context, String dateString) {
      final DateTime date = DateFormat('dd MMMM yyyy', 'en').parse(dateString);
      final String locale = Localizations.localeOf(context).toLanguageTag();
      return DateFormat('d MMMM yyyy', locale).format(date);
    }

    return Container(
      color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.profile,
            style: Theme.of(context).textTheme.displayLarge!,
          ),
          const Gap(8),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2A2929) : Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name.initials,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Gap(4),
                    Text(
                      '${AppLocalizations.of(context)!.member_since} ${formatDate(context, date)}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.dark),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
