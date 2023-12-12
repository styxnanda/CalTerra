import 'package:flutter/material.dart';

class EmissionEntry {
  final String type;
  final String subType;
  final double emission;
  final DateTime timestamp;

  EmissionEntry(
      {required this.type,
      required this.subType,
      required this.emission,
      required this.timestamp});

  factory EmissionEntry.fromJson(Map<String, dynamic> json) {
    String subTypeValue;
    if (json.containsKey('sub_type')) {
      subTypeValue = json['sub_type'] as String? ?? 'DefaultSubType';
    } else if (json.containsKey('vehicle_type')) {
      subTypeValue = json['vehicle_type'] as String? ?? 'DefaultVehicleType';
    } else {
      subTypeValue = 'Unknown'; // Default value or handle as needed
    }
    return EmissionEntry(
      type: json['type'] as String? ?? 'DefaultType',
      subType: subTypeValue,
      emission: json['emission'] != null
          ? double.tryParse(json['emission'].toString()) ?? 0.0
          : 0.0,
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp']) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
