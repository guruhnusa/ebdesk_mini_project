import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/constant/app_color.dart';

class CustomHeatmap extends StatelessWidget {
  final int year;
  final Map<DateTime, int> datasets;

  const CustomHeatmap({super.key, required this.year, required this.datasets});

  @override
  Widget build(BuildContext context) {
    double boxSize = 6;
    int weeksInYear = 53;
    int daysInWeek = 7;

    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int startColumn = firstDayOfYear.weekday % 7;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(12, (monthIndex) {
              int weeksInMonth = _weeksInMonth(year, monthIndex + 1);
              return SizedBox(
                width: (weeksInMonth * (boxSize + 0.5)),
                child: Center(
                  child: Text(
                    _monthName(monthIndex + 1, context),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark ? AppColor.darkModeGrey : Colors.black,
                        ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(weeksInYear, (col) {
              return Column(
                children: List.generate(daysInWeek, (row) {
                  DateTime date = _getDateFromGridPosition(year, row, col, startColumn);
                  bool isValidDay = date.year == year;
                  bool hasActivity = isValidDay && datasets.containsKey(date) && datasets[date]! > 0;

                  return Container(
                    width: boxSize,
                    height: boxSize,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: isValidDay
                          ? (hasActivity
                              ? AppColor.blue
                              : Theme.of(context).brightness == Brightness.light
                                  ? const Color(0xFFF6F6F6)
                                  : AppColor.darkModeBlack)
                          : Colors.transparent,
                    ),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }

  DateTime _getDateFromGridPosition(int year, int row, int col, int startColumn) {
    DateTime firstDayOfYear = DateTime(year, 1, 1);
    int dayOffset = (col * 7) + row - startColumn;
    return firstDayOfYear.add(Duration(days: dayOffset));
  }

  String _monthName(int month, BuildContext context) {
    final String locale = Localizations.localeOf(context).toLanguageTag();

    return DateFormat.MMM(locale).format(DateTime(0, month));
  }

  int _weeksInMonth(int year, int month) {
    DateTime firstDay = DateTime(year, month, 1);
    DateTime lastDay = DateTime(year, month + 1, 0);
    return ((lastDay.difference(firstDay).inDays + firstDay.weekday) / 7).ceil();
  }
}
