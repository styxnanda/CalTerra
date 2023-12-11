import 'dart:async';
import 'dart:convert';

import 'package:calterra/viewModel/view_food_emission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

class HomeEmission extends StatefulWidget {
  const HomeEmission({Key? key}) : super(key: key);

  @override
  State<HomeEmission> createState() => _HomeEmissionState();
}

class _HomeEmissionState extends State<HomeEmission> {
  int page = -1; // Default selected carousel page, (only 0, 1 possible)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 124, 178, 1),
      ),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(top: 40, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Column(children: [
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/image/Home-Emission-Icon.png",
                      width: 200,
                      height: 110,
                      fit: BoxFit.contain,
                    ))
              ])),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Home Emission",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Cancel",
                              style: TextStyle(
                                  color: Color.fromRGBO(99, 146, 38, 1),
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  color: Color.fromRGBO(99, 146, 38, 1)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0))))),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(99, 146, 38, 1),
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                  color: Color.fromRGBO(99, 146, 38, 1)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)))))
                ],
              ))
        ],
      ),
    ));
  }
}
