class WorkModel {
  final String remaining;
  final String working;
  final String target;
  final String failedValue;
  final String failedPercentage;

  final String progressValue;
  final String progressPercentage;
  final String successValue;
  final String successPercentage;

  WorkModel(
      {required this.remaining,
      required this.working,
      required this.target,
      required this.failedValue,
      required this.failedPercentage,
      required this.progressValue,
      required this.progressPercentage,
      required this.successValue,
      required this.successPercentage});
}
