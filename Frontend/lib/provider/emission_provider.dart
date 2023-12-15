// providers/emission_provider.dart
import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/emission_data.dart';
import 'package:flutter/material.dart';

class EmissionProvider with ChangeNotifier {
  EmissionData? emissionData;

  final ApiService apiService;

  EmissionProvider({required this.apiService});

  Future<void> loadEmissionData(String userId) async {
    try {
      emissionData = await apiService.fetchEmissionData();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
