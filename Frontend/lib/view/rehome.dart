import 'dart:convert';
import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_home.dart';
import 'package:calterra/viewModel/view_news_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? thisUsername;

  @override
  initState() {
    super.initState();
    fetchUsernameMethod();
  }

  void fetchUsernameMethod() async {
    String? fetchedUsername = await fetchUsername();
    setState(() {
      thisUsername = fetchedUsername;
    });
  }

  Future<String?> fetchUsername() async {
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData('account/user');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['username'];
    } else {
      throw Exception('Failed to fetch user id with error code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(232, 252, 208, 1),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/image/Header.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text("Welcome, ${thisUsername}!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),),
                      ]
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
