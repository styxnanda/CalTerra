import 'dart:convert';
import 'package:calterra/api/apiService.dart';
import 'package:flutter/material.dart';

class EmissionChart extends StatefulWidget {
  EmissionChart({Key? key}) : super(key: key);

  @override
  _EmissionChartState createState() => _EmissionChartState();
}

class _EmissionChartState extends State<EmissionChart> {
  late Future<List<Map<String, dynamic>>> chartData;

  @override
  void initState() {
    super.initState();
    chartData = fetchChartData();
  }

  Color getColorForType(String type) {
    switch (type) {
      case 'vehicle':
        return const Color.fromRGBO(172, 49, 49, 1);
      case 'house':
        return const Color.fromRGBO(33, 124, 178, 1);
      case 'food':
        return const Color.fromRGBO(197, 179, 25, 1);
      case 'flight':
        return const Color.fromRGBO(146, 160, 169, 1);
      default:
        return Colors.black;
    }
  }

  Future<List<Map<String, dynamic>>> fetchChartData() async {
    ApiService apiService = ApiService();
    final response = await apiService.getData('account/user/contribution');

    if (response.statusCode == 200) {
      debugPrint('API response: ${response.body}');
      List<dynamic> data = json.decode(response.body);
      return data
          .map((item) => {
                'type': item['type'],
                'units': item['total_emission'],
                'color': getColorForType(item['type']),
              })
          .toList();
    } else {
      throw Exception(
          'Failed to fetch emission data with error code: ${response.statusCode}');
    }
  }

  @override
Widget build(BuildContext context) {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: chartData,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        final chartData = snapshot.data ?? [];
        double totalUnits = chartData.fold(
          0.0,
          (previousValue, element) => element['units'] is num ? previousValue + element['units'] : previousValue,
        );
        debugPrint(chartData.toString());
        if (totalUnits == 0) {
          return Text('No data available for the chart');
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: Row(
              children: chartData.map((data) {
                final units = data['units'] is num ? data['units'] : 0;
                final flexValue = totalUnits > 0 ? (units / totalUnits * 1000).round() : 0;
                return Expanded(
                  flex: flexValue,
                  child: Container(
                    height: 16,
                    color: data['color'],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      }
    },
  );
}

}
