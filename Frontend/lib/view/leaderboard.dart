import 'package:calterra/api/apiService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  List<Map<String, dynamic>>? leaderboardData;
  String? username = '';

  @override
  void initState() {
    super.initState();
    fetchUsername();
    fetchLeaderboardData();
  }

  void fetchUsername() async {
    final ApiService apiService = ApiService();
    var response = await apiService.getData('account/user');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        username = jsonData['username'];
      });
    } else {
      throw Exception(
          'Failed to fetch username with error code: ${response.statusCode}');
    }
  }

  void fetchLeaderboardData() async {
    final ApiService apiService = ApiService();
    var response = await apiService.getData('leaderboard');
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        leaderboardData = jsonData
            .map<Map<String, dynamic>>(
                (item) => Map<String, dynamic>.from(item))
            .toList();
      });
    } else {
      throw Exception(
          'Failed to fetch leaderboard data with error code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Leaderboard")),
        body: leaderboardData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  var user = leaderboardData![index];
                  var emission = user['monthly_total_emission'];
                  var emissionDisplay = emission != 'NaN' && emission != null
                      ? double.tryParse(emission)?.toStringAsFixed(2) ?? 'N/A'
                      : 'N/A';
                  bool isCurrentUser = user['username'] == username;

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                      foregroundColor: Colors.white,
                      backgroundColor: isCurrentUser
                          ? Colors.green
                          : Color.fromRGBO(172, 49, 49, 1),
                    ),
                    title: Row(
                      children: [
                        Text(user['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: isCurrentUser ? Colors.green : null,
                            )),
                        isCurrentUser == true
                            ? Text(' (YOU)',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  color: Colors.green,
                                ))
                            : Text(''),
                      ],
                    ),
                    subtitle: Text('Emission: $emissionDisplay kg'),
                    tileColor: index % 2 == 0 ? Colors.white : Colors.grey[100],
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.blueGrey),
                itemCount: leaderboardData!.length,
              ));
  }
}
