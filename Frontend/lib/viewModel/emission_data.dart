import 'monthly_emission_data.dart';

class EmissionData {
  final MonthlyEmissionData latestMonth;
  final MonthlyEmissionData? previousMonth;
  final double? change;

  EmissionData({
    required this.latestMonth,
    this.previousMonth,
    this.change,
  });

  factory EmissionData.fromJson(Map<String, dynamic> json) {
    return EmissionData(
      latestMonth: MonthlyEmissionData.fromJson(json['latestMonth']),
      previousMonth: json['previousMonth'] != null
          ? MonthlyEmissionData.fromJson(json['previousMonth'])
          : null,
      change: json['change'] != null ? double.tryParse(json['change'].toString()) : null,
    );
  }
}
