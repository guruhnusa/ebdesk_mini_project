import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../../../core/utils/usecases/usecases.dart';
import '../models/work_model.dart';
import '../repository/home_repository.dart';

class GetWork implements UseCase<WorkModel, void> {
  final HomeRepository repository;

  GetWork({required this.repository});
  @override
  Future<Either<Failure, WorkModel>> call(void params) {
    return repository.getWork();
  }
}
