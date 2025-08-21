class PlanDurationModel {
  final String durationYear;
  final String planPrice;
  final String? savePrice;

  PlanDurationModel({
    this.savePrice,
    required this.durationYear,
    required this.planPrice,
  });

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return super == other;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}
