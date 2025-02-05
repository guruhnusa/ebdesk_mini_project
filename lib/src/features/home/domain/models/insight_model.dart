class InsightAnalythicModel {
  final InsightModel expenditure;
  final InsightModel income;

  InsightAnalythicModel({required this.expenditure, required this.income});
}

class InsightModel {
  final String date;
  final String value;
  final List<double> xChart;
  final List<double> yChart;

  InsightModel({required this.date, required this.value, required this.xChart, required this.yChart});
}
