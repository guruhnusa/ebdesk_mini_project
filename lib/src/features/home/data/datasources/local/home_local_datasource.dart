import '../../../domain/models/insight_model.dart';
import '../../../domain/models/work_model.dart';
import '../dummy/analythic_dummy_data.dart';
import '../dummy/work_dummy_data.dart';

abstract class HomeDatasource {
  Future<WorkModel> getWork();
  Future<InsightAnalythicModel> getInsightAnalythic();
}

class HomeLocalDatasourceImpl implements HomeDatasource {
  @override
  Future<WorkModel> getWork() async {
    final data = workDummyData;
    return data;
  }

  @override
  Future<InsightAnalythicModel> getInsightAnalythic() async {
    final data = insightAnalythicDummyData;
    return data;
  }
}
