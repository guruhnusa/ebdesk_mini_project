import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/insight_model.dart';
import '../../domain/usecases/get_insight_analythic.dart';
import 'repository/home_repository_provider.dart';

part 'get_insight_analythic_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<InsightAnalythicModel> getInsightAnalythic(Ref ref) async {
  GetInsightAnalythic getInsightAnalythic = GetInsightAnalythic(
    repository: ref.read(homeRepositoryProvider),
  );
  final result = await getInsightAnalythic(null);
  await Future.delayed(const Duration(seconds: 1));
  return result.fold((l) => throw l, (r) => r);
}
