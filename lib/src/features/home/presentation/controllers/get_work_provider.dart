import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/models/work_model.dart';
import '../../domain/usecases/get_work.dart';
import 'repository/home_repository_provider.dart';

part 'get_work_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<WorkModel> getWork(Ref ref) async {
  GetWork getWork = GetWork(
    repository: ref.read(homeRepositoryProvider),
  );
  final result = await getWork(null);
  await Future.delayed(const Duration(seconds: 1));
  return result.fold((l) => throw l, (r) => r);
}
