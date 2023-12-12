import 'dart:async';
import 'dart:convert';

import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_food_emission.dart';
import 'package:calterra/viewModel/view_home_emission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class HomeEmission extends StatefulWidget {
  const HomeEmission({Key? key}) : super(key: key);

  @override
  State<HomeEmission> createState() => _HomeEmissionState();
}

Future<void> createHomeAppliancesEmission(BuildContext context, List<Map<String, dynamic>> homeAppliance) async {
  final ApiService apiService  = ApiService();
  List<int> responseCode = [];
  for (var appliance in homeAppliance) {
    final Map<String, dynamic> data = {
      'appliances_type': appliance['appliances_type'],
      'duration_or_cycles': appliance['duration_or_cycles'].text.toString(),
    };
    final response = await apiService.postRequest('calculation/home_appliances', data);
    responseCode.add(response.statusCode);
  }

  // check if all response code is 200
  if (responseCode.every((element) => element == 200)) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Home Appliances emission created successfully.'),
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
          content: Text('Failed to create home appliances emission.'),
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
  }
}

Future<void> createPowerSourceEmission(BuildContext context, List<Map<String, dynamic>> powerSourceList ) async {
  final ApiService apiService  = ApiService();
  List<int> responseCode = [];
  for (var power in powerSourceList) {
    if (power['selected'] == true) {
      final Map<String, dynamic> data = {
        'power_sources_type': power['power_sources_type'],
        'usage': power['usage'].text.toString(),
      };
      final response = await apiService.postRequest('calculation/power_sources', data);
      responseCode.add(response.statusCode);
    }
  }
  // check if all response code is 200
  if (responseCode.every((element) => element == 200)) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Power Source emission created successfully.'),
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
          content: Text('Failed to create power sources emission.'),
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
  }
}

class _HomeEmissionState extends State<HomeEmission> {
  int page = 0; // Default selected carousel page, (only 0, 1 possible)
  final List<Map<String, dynamic>> homeAppliancesList = [];
  final List<Map<String, dynamic>> powerSourceList = [
    {
      'index': 0,
      'power_sources_type': 'electricity',
      'usage': TextEditingController(),
      'selected': false,
    },
    {
      'index': 1,
      'power_sources_type': 'gas',
      'usage': TextEditingController(),
      'selected': false,
    },
    {
      'index': 2,
      'power_sources_type': 'water',
      'usage': TextEditingController(),	
      'selected': false,
    },
  ];

  void changePage(int newPage) {
    setState(() {
      page = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: page);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Widget homeApplianceWidget(Map<String, dynamic> homeAppliance){
      TextEditingController usage = homeAppliance['duration_or_cycles'];

      return Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),   
        padding: EdgeInsets.all(10), 
        //box shadow
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(homeAppliance['appliances_type'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Container(
                  height: 32,
                  width: screenWidth * 0.5 + 40,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // print TextEditingController.text,
                    controller: usage,
                    onChanged: (value) {
                    },                    
                    decoration: InputDecoration(                     
                      hintText: 'Usage',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        height: 0,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        height: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 99, 146, 38),
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                    ),
                  ),
                  
                )
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  homeAppliancesList.remove(homeAppliance);
                  print(homeAppliancesList);                  
                });
              },
              icon: Icon(Icons.delete),
            )
          ],
        )
      );
    }  

    Widget powerSourceWidget(Map<String, dynamic> powerSource){
      String imageUrl = '';
      String title = '';
      TextEditingController usage = powerSource['usage'];

      int index = powerSource['index'];
      switch(powerSource['power_sources_type']){
        case 'electricity':
          imageUrl = 'assets/image/electricity.png';
          title = 'Electricity';
          break;
        case 'gas':
          imageUrl = 'assets/image/gas.png';
          title = 'Natural Gas';
          break;
        case 'water':
          imageUrl = 'assets/image/water.png';
          title = 'Water';
          break;
      }

      return Container(    
        margin: EdgeInsets.only(bottom: 15),   
        padding: EdgeInsets.all(10), 
        //box shadow
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xffE8FCD0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.16),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],            
                      ),
                      child: Image.asset(imageUrl, height: 20, width: 20),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          "Usage in the last month", 
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)
                        ),
                      ],
                    )
                  ],
                ),
                Container(    
                  margin: EdgeInsets.only(top: 10),              
                  height: 32, // You can adjust this as needed    
                  width: screenWidth * 0.5 + 40, // You can adjust this as needed            
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // print TextEditingController.text,
                    controller: usage,
                    onChanged: (value) {
                    },                    
                    decoration: InputDecoration(                     
                      hintText: 'Usage',
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        height: 0,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        height: 0,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 99, 146, 38),
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Checkbox(
                // fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF63A826)),
                // change color when selected
                activeColor: Color.fromARGB(255, 99, 146, 38),
                value: powerSource['selected'] ?? false,
                onChanged: (bool? value) {
                  setState(() {
                    powerSource['selected'] = value;
                    print(powerSource);
                  });
                },
              ),
            ),
          ],
        ),
      );
    }

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewHomeEmission(),
      builder: (context, model, child) => Scaffold(
      bottomNavigationBar: Container(
          height: screenHeight * 0.1,
          width: screenWidth,
          color: Colors.white,
          child: Stack(
            children: [
              ButtonBar(
                // aligment horizontal
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                      'Cancel', 
                      style: TextStyle(
                        color: Color.fromARGB(255, 99, 146, 38), 
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                        ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(160, 45),
                        // border color
                        primary: Colors.white,
                        side: BorderSide(
                          color: Color.fromARGB(255, 99, 146, 38),
                          width: 2,
                        ),                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (page == 0) {
                        createPowerSourceEmission(context, powerSourceList);
                      } else {
                        createHomeAppliancesEmission(context, homeAppliancesList);
                      }
                    },                    
                    child: Text(
                      'Save', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 16,
                        fontWeight: FontWeight.bold)
                        ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(160, 45),
                      backgroundColor: Color.fromARGB(255, 99, 146, 38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                  Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      page = 0;
                                      pageController.animateToPage(page,
                                          duration:
                                              Duration(milliseconds: 100),
                                          curve: Curves.easeIn);
                                    });
                                  },
                                  child: Text("Power Sources",
                                      style: TextStyle(
                                        color: page == 0
                                            ? Colors.white
                                            : Color.fromRGBO(99, 146, 38, 1),
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(150, 25),
                                    backgroundColor: page == 0
                                        ? Color.fromRGBO(99, 146, 38, 1)
                                        : Colors.white,
                                      side: BorderSide(
                                          color:
                                              Color.fromRGBO(99, 146, 38, 1)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)
                                )
                              )
                            )
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    page = 1;
                                    pageController.animateToPage(page,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.easeIn);
                                  });
                                },
                                child: Text("Home Appliances",
                                    style: TextStyle(
                                        color: page == 1
                                            ? Colors.white
                                            : Color.fromRGBO(99, 146, 38, 1),
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(150, 25),
                                    backgroundColor: page == 1
                                        ? Color.fromRGBO(99, 146, 38, 1)
                                        : Colors.white,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(
                                        color:
                                            Color.fromRGBO(99, 146, 38, 1)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0)
                                )
                              )
                            )
                          )
                        ],
                      )
                    ),
                    Container(
                      // padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      height: screenHeight * 0.5,
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            page = value;
                          });                        
                        },
                        children: [
                          Container(
                            height: screenHeight * 0.5,
                            child: ListView.builder(
                              itemCount: powerSourceList.length,
                              itemBuilder: (context, index) {
                                print(powerSourceList[index]);
                                var powerSource = powerSourceList[index];
                                return powerSourceWidget(powerSource);
                              },
                            )
                          ),
                          // home appliances
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                                  height: screenHeight * 0.1,
                                  child: DropdownButtonFormField(                                    
                                    onChanged: (value) {
                                      setState(() {
                                        homeAppliancesList.add({
                                          'index' : homeAppliancesList.length,
                                          'appliances_type': value,
                                          'duration_or_cycles': TextEditingController(),
                                        });
                                      });
                                    },
                                    hint: Text('Select Home Appliances'),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 99, 146, 38),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 0,
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        child: Text('Air Conditioner'),
                                        value: 'Air Conditioner',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Refrigerator'),
                                        value: 'Refrigerator',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Washing Machine'),
                                        value: 'Washing Machine',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('TV'),
                                        value: 'TV',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Dishwasher'),
                                        value: 'Dishwasher',
                                      ),
                                      DropdownMenuItem(
                                        child: Text('Stove'),
                                        value: 'Stove',
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: screenHeight * 0.4,
                                  child: ListView.builder(
                                    itemCount: homeAppliancesList.length,
                                    itemBuilder: (context, index) {
                                      var homeAppliance = homeAppliancesList[index];
                                      return homeApplianceWidget(homeAppliance);
                                    },
                                  )
                                ),
                              ],
                            ) 
                          ),
                        ],
                      )
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    )
    );
  }
}
