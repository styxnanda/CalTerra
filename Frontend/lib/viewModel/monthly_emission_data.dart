// models/monthly_emission_data.dart
class MonthlyEmissionData {
  final int id;
  final String userId;
  final DateTime yearMonth;
  final double? monthlyTotalEmission;

  MonthlyEmissionData({
    required this.id,
    required this.userId,
    required this.yearMonth,
    this.monthlyTotalEmission,
  });

  factory MonthlyEmissionData.fromJson(Map<String, dynamic> json) {
    return MonthlyEmissionData(
      id: json['id'],
      userId: json['user_id'],
      yearMonth: DateTime.parse(json['year_month']),
      monthlyTotalEmission: (json['monthly_total_emission'] != "NaN" && json['monthly_total_emission'] != null)
        ? double.tryParse(json['monthly_total_emission'].toString()) 
        : null,
    );
  }
}
