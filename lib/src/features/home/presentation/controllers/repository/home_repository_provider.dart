import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/datasources/local/home_local_datasource.dart';
import '../../../data/repository/home_repository_impl.dart';
import '../../../domain/repository/home_repository.dart';

part 'home_repository_provider.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(datasource: HomeLocalDatasourceImpl());
}
