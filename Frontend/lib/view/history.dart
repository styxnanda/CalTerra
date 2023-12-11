import 'package:calterra/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:calterra/viewModel/view_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(width: 20,),
                  Container(
                      child: Text(
                          "Your logged emission from flight, vehicle, house, and food",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 1)))),
                ]),
                SizedBox(height: 30),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                ))
              ],
            )));
  }
}
