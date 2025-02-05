import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/utils/constant/app_color.dart';

class InsightAnalyticsCard extends StatelessWidget {
  final String title;
  final String date;
  final Color chartColor;
  final String value;
  final List<double> xChart;
  final List<double> yChart;

  const InsightAnalyticsCard({
    super.key,
    required this.title,
    required this.date,
    required this.chartColor,
    required this.value,
    required this.xChart,
    required this.yChart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Gap(4),
                Text(
                  "$date - ${AppLocalizations.of(context)!.now}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.lightModeGrey,
                      ),
                ),
                const Gap(12),
                SizedBox(
                  height: 10,
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: List.generate(xChart.length, (index) {
                            return FlSpot(xChart[index], yChart[index]);
                          }),
                          isCurved: false,
                          color: chartColor,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                              radius: 2.5,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: chartColor,
                            ),
                          ),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          Divider(
            color: Theme.of(context).brightness == Brightness.light ? const Color(0xFFEAEAEA) : const Color(0xFF292929),
            thickness: 1,
          ),
          const Gap(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Gap(4),
                Text(
                  AppLocalizations.of(context)!.task,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xFF757276),
                      ),
                ),
              ],
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}
