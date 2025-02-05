import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../domain/models/insight_model.dart';
import '../../domain/models/work_model.dart';
import '../../domain/repository/home_repository.dart';
import '../datasources/local/home_local_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDatasource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, WorkModel>> getWork() async {
    try {
      final data = await datasource.getWork();
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InsightAnalythicModel>> getInsightAnalythic()async {
    try {
      final data = await datasource.getInsightAnalythic();
      return Right(data);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
