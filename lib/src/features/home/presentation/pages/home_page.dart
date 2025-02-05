import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../../core/extensions/string_ext.dart';
import '../../../../core/routers/route_name.dart';
import '../../../../core/utils/constant/app_color.dart';
import '../controllers/get_insight_analythic_provider.dart';
import '../controllers/get_work_provider.dart';
import '../widgets/home_dashboard.dart';
import '../widgets/indicator_home.dart';
import '../widgets/insight_analytics_card.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workState = ref.watch(getWorkProvider);

    final insightAnalythicState = ref.watch(getInsightAnalythicProvider);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(getWorkProvider);
            ref.invalidate(getInsightAnalythicProvider);
          },
          child: ListView(
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              workState.when(
                skipLoadingOnRefresh: false,
                data: (data) {
                  return HomeDashboard(
                    data: data,
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      'Error: $error',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.orange),
                    ),
                  );
                },
                loading: () {
                  return const HomeDashboard();
                },
              ),
              const Gap(16),
              const IndicatorHome(),
              const Gap(12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.insight_analytics,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      onPressed: () {
                        context.push(RouteName.insight);
                      },
                    )
                  ],
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: insightAnalythicState.when(
                  skipLoadingOnRefresh: false,
                  data: (data) {
                    final expenditure = data.expenditure;
                    final habitsTrend = data.income;
                    final String locale = Localizations.localeOf(context).toLanguageTag();

                    return Row(
                      children: [
                        Expanded(
                          child: InsightAnalyticsCard(
                            title: AppLocalizations.of(context)!.expenditure,
                            date: expenditure.date.formatToShortDate(locale),
                            chartColor: AppColor.orange,
                            value: expenditure.value,
                            xChart: expenditure.xChart,
                            yChart: expenditure.yChart,
                          ),
                        ),
                        const Gap(12),
                        Expanded(
                          child: InsightAnalyticsCard(
                            title: AppLocalizations.of(context)!.habits_trend,
                            date: habitsTrend.date.formatToShortDate(locale),
                            chartColor: AppColor.blue,
                            value: habitsTrend.value,
                            xChart: habitsTrend.xChart,
                            yChart: habitsTrend.yChart,
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        'Error: $error',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.orange),
                      ),
                    );
                  },
                  loading: () {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(2, (index) {
                        return Expanded(
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 150,
                              margin: EdgeInsets.only(right: index == 0 ? 12 : 0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
