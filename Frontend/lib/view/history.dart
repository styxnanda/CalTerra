import 'dart:convert';

import 'package:calterra/api/apiService.dart';
import 'package:calterra/view/home.dart';
import 'package:calterra/view/login.dart';
import 'package:calterra/viewModel/view_emission_entry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:calterra/viewModel/view_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

bool isLoading = false;

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int timeRange =
      3; // Possible values are 0 (today), 1 (a week), 2 (a month), 3 (all-time)
  List<EmissionEntry> emissionEntries = [];
  String? userId;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    fetchUserIdAndEmissionHistory();
  }

  void fetchUserIdAndEmissionHistory() async {
    try {
      String? userId = await fetchUserId();
      debugPrint('User id atas: $userId');
      if (userId != null && userId.isNotEmpty) {
        List<EmissionEntry> entries =
            await fetchEmissionHistory(userId, timeRange);
        setState(() {
          emissionEntries = entries;
          isLoading = false;
        });
      } else {
        debugPrint("User ID is empty or null");
      }
    } catch (e) {
      debugPrint('Error fetching user id and emission history: $e');
    }
  }

  void updateEmissionHistory() async {
    userId = await fetchUserId();
    if (userId != null) {
      try {
        List<EmissionEntry> entries =
            await fetchEmissionHistory(userId!, timeRange);
        setState(() {
          emissionEntries = entries;
          isLoading = false;
        });
      } catch (e) {
        debugPrint("error updating history: $e");
      }
    }
  }

  Future<String?> fetchUserId() async {
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData('account/user');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      debugPrint('User id: ${data['id']}');
      return data['id'];
    } else {
      throw Exception('Failed to fetch user id with error code: ${response.statusCode}');
    }
  }

  Future<List<EmissionEntry>> fetchEmissionHistory(
      String userId, int timeRange) async {
    final ApiService apiService = ApiService();
    DateTime endDate = DateTime.now();
    DateTime startDate;
    debugPrint('User id: $userId and time range: $timeRange');

    switch (timeRange) {
      case 0: // Today
        startDate = DateTime(endDate.year, endDate.month, endDate.day);
        break;
      case 1: // A Week
        startDate = endDate.subtract(Duration(days: 7));
        break;
      case 2: // A Month
        startDate = DateTime(endDate.year, endDate.month - 1, endDate.day);
        break;
      case 3: // All-time
        startDate = DateTime(2000);
        break;
      default:
        startDate = DateTime.now(); // Arbitrary early date
        break;
    }

    debugPrint('Start date: $startDate and end date: $endDate and userId: $userId');
    final response = await apiService.postRequest(
        "account/history",
        {
          'userId': userId,
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
        urlEncoded: true);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => EmissionEntry.fromJson(data)).toList();
    } else if (response.statusCode == 401) {
      Get.offAll(Login());
      return [];
    } else {
      throw Exception('Failed to load emission history  with error code: ${response.statusCode} and userId: $userId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(232, 252, 223, 1)),
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Text("Emission History",
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 0, 0, 1)))),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: Text(
                          "Your logged emission from flight, vehicle, house, and food",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1)))),
                ]),
                SizedBox(height: 20),
                Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: ElevatedButton(
                                    onPressed: () async{
                                      setState(() {
                                        timeRange = 0;
                                        isLoading = true;
                                      });
                                      updateEmissionHistory();
                                    },
                                    child: Text("Today",
                                        style: TextStyle(
                                            color: timeRange == 0
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    99, 146, 38, 1),
                                            fontFamily: "Poppins",
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: timeRange == 0
                                            ? Color.fromRGBO(99, 146, 38, 1)
                                            : Color.fromRGBO(232, 252, 223, 1),
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(99, 146, 38, 1)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0)))))),
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        timeRange = 1;
                                        isLoading = true;
                                      });
                                      updateEmissionHistory();
                                    },
                                    child: Text("A Week",
                                        style: TextStyle(
                                            color: timeRange == 1
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    99, 146, 38, 1),
                                            fontFamily: "Poppins",
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: timeRange == 1
                                            ? Color.fromRGBO(99, 146, 38, 1)
                                            : Color.fromRGBO(232, 252, 223, 1),
                                        foregroundColor: Colors.white,
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(99, 146, 38, 1)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0)))))),
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        timeRange = 2;
                                        isLoading = true;
                                      });
                                      updateEmissionHistory();
                                    },
                                    child: Text("A Month",
                                        style: TextStyle(
                                            color: timeRange == 2
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    99, 146, 38, 1),
                                            fontFamily: "Poppins",
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: timeRange == 2
                                            ? Color.fromRGBO(99, 146, 38, 1)
                                            : Color.fromRGBO(232, 252, 223, 1),
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(99, 146, 38, 1)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0)))))),
                        Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        timeRange = 3;
                                        isLoading = true;
                                      });
                                      updateEmissionHistory();
                                    },
                                    child: Text("All-time",
                                        style: TextStyle(
                                            color: timeRange == 3
                                                ? Colors.white
                                                : Color.fromRGBO(
                                                    99, 146, 38, 1),
                                            fontFamily: "Poppins",
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold)),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: timeRange == 3
                                            ? Color.fromRGBO(99, 146, 38, 1)
                                            : Color.fromRGBO(232, 252, 223, 1),
                                        foregroundColor: Colors.white,
                                        side: BorderSide(
                                            color:
                                                Color.fromRGBO(99, 146, 38, 1)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0)))))),
                      ],
                    )),
                SizedBox(height: 30),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: ListView.builder(
                        itemCount: emissionEntries.length,
                        itemBuilder: (BuildContext context, int index) {
                          EmissionEntry entry = emissionEntries[index];
                          return ListTile(
                            leading: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: entry.type == 'Vehicle'
                                        ? Color.fromRGBO(172, 49, 49, 1)
                                        : entry.type == 'Food'
                                            ? Color.fromRGBO(197, 179, 25, 1)
                                            : entry.type == 'Home Appliance' ||
                                                    entry.type == 'Power Source'
                                                ? Color.fromRGBO(
                                                    49, 172, 172, 1)
                                                : entry.type == 'Flight'
                                                    ? Color.fromRGBO(
                                                        146, 160, 169, 1)
                                                    : Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      fit: BoxFit.scaleDown,
                                      image: AssetImage(
                                        entry.type == 'Vehicle'
                                            ? 'assets/image/front-car.png'
                                            : entry.type == 'Food'
                                                ? 'assets/image/cutlery.png'
                                                : entry.type ==
                                                            'Home Appliance' ||
                                                        entry.type ==
                                                            'Power Source'
                                                    ? 'assets/image/House.png'
                                                    : entry.type == 'Flight'
                                                        ? 'assets/image/plane.png'
                                                        : '',
                                      ),
                                    ))),
                            title: Text(entry.subType.toUpperCase()),
                            subtitle: Text(
                                'From ${entry.type.toLowerCase()} emission.'),
                            trailing: Text('${entry.emission.toStringAsFixed(2)} kg CO2'),
                          );
                        }),
                  ),
                ),
              ],
            )
          ),
        ),
        if (isLoading)
            const Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: Colors.black),
            ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
      ],
    );
  }
}
