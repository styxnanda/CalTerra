import 'dart:async';
import 'dart:convert';

import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_food_emission.dart';
import 'package:flutter/material.dart';
import 'package:calterra/api/apiService.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FoodEmission extends StatefulWidget {
  const FoodEmission({Key? key}) : super(key: key);

  @override
  State<FoodEmission> createState() => _FoodEmissionState();
}

Future<http.Response> createFoodEmission(
    BuildContext context, String food_type) async {
  final ApiService apiService = ApiService();
  final response = await apiService.postRequest(
      'calculation/food',
      {
        'food_type': food_type,
      },
      urlEncoded: true);
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Food emission created successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to create food emission.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    throw Exception(response.body);
  }
}

class _FoodEmissionState extends State<FoodEmission> {
  List choices = [];
  int selectedItem = -1;
  String foodEmission = 'Low Meat';
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/foodEMChoices.json")
        .then((value) {
      setState(() {
        choices = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 197, 180, 25),
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
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
                        "assets/image/Food-Menu-Icon.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "Food Emission",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: choices.length,
                                  itemBuilder: (_, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        debugPrint(index.toString());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        height: 100,
                                        width: 230,
                                        child: Column(
                                          children: [
                                            Material(
                                                color: selectedItem == index
                                                    ? Color.fromRGBO(
                                                        99, 146, 38, 1)
                                                    : Colors.transparent,
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        if (selectedItem ==
                                                            index) {
                                                          selectedItem = -1;
                                                        } else {
                                                          selectedItem = index;
                                                        }
                                                        setState(() {
                                                          foodEmission =
                                                              choices[index]
                                                                  ["name"];
                                                          print(foodEmission);
                                                        });
                                                      });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: 80,
                                                          height: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                                  // hex color style
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          232,
                                                                          252,
                                                                          208,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  image: DecorationImage(
                                                                      image: AssetImage(
                                                                          choices[index]
                                                                              [
                                                                              'picture']))),
                                                        ),
                                                        SizedBox(
                                                          width: 15,
                                                        ),
                                                        Flexible(
                                                            child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              choices[index]
                                                                  ["name"],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 3),
                                                                child: Text(
                                                                  choices[index]
                                                                      ["desc"],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ))
                                                          ],
                                                        ))
                                                      ],
                                                    )))
                                          ],
                                        ),
                                      ),
                                    );
                                  }))
                        ]))),
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
                                    borderRadius:
                                        BorderRadius.circular(30.0))))),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              createFoodEmission(context, foodEmission);
                              print(foodEmission);
                            },
                            child: Text("Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedItem > -1
                                    ? Color.fromRGBO(99, 146, 38, 1)
                                    : Color.fromRGBO(99, 146, 38, 0.3),
                                foregroundColor: Colors.white,
                                side: BorderSide(
                                    color: Color.fromRGBO(99, 146, 38, 1)),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(30.0)))))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
