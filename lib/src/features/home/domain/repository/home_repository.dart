import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../models/insight_model.dart';
import '../models/work_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, WorkModel>> getWork();
  Future<Either<Failure, InsightAnalythicModel>> getInsightAnalythic();
}
