import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/usecases/usecases.dart';
import '../models/insight_model.dart';
import '../repository/home_repository.dart';

class GetInsightAnalythic implements UseCase<InsightAnalythicModel, void> {
  final HomeRepository repository;

  GetInsightAnalythic({required this.repository});
  @override
  Future<Either<Failure, InsightAnalythicModel>> call(void params) {
    return repository.getInsightAnalythic();
  }
}
