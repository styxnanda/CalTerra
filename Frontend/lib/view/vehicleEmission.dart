import 'dart:async';
import 'dart:convert';

import 'package:calterra/viewModel/view_vehicle_emission.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VehicleEmission extends StatefulWidget {
  const VehicleEmission({Key? key}) : super(key: key);

  @override
  State<VehicleEmission> createState() => _VehicleEmissionState();
}


class _VehicleEmissionState extends State<VehicleEmission> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // List<bool> isSelected = [true, false, false, false, false];
    List<String> vehicleList = [];

    void selectVehicleBottomDialog(BuildContext context){
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: screenHeight * 0.35, // You can adjust this as needed
            child: Column(
              children: [
                // add two text button at the top left and right corner
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Select Transport Type', 
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),                    
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.015 + 10,
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: Center(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10, right: 10),
		                  children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              //exit form dialog
                              setState(() {
                                vehicleList.add('Car');                              
                              });
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/front-car.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                     
                                Text(
                                  'Car',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),                                      
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFFFF4208),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rectangle shape
                              ),
                              maximumSize: Size(300, screenHeight * 0.1),
                              fixedSize: Size(screenWidth * 0.3, screenHeight * 0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              //exit form dialog
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/front-bus.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                  
                                Text(
                                  'Bus',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),                                      
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF023047),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rectangle shape
                              ),
                              maximumSize: Size(300, screenHeight * 0.1),
                              fixedSize: Size(screenWidth * 0.3, screenHeight * 0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              //exit form dialog
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/front-train.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                    
                                Text(
                                  'Train',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),                                      
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF6CA2EA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rectangle shape
                              ),
                              maximumSize: Size(300, screenHeight * 0.1),
                              fixedSize: Size(screenWidth * 0.3, screenHeight * 0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              //exit form dialog
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/front-motor.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                 
                                Text(
                                  'Motorbike',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFFFED23F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rectangle shape
                              ),
                              maximumSize: Size(300, screenHeight * 0.1),
                              fixedSize: Size(screenWidth * 0.3, screenHeight * 0.08),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                            onPressed: () {
                              //exit form dialog
                              Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/electric-cycle.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                   
                                Text(
                                  'Electric Bicycle',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color(0xFF7DBD2B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20), // Rectangle shape
                              ),
                              maximumSize: Size(300, screenHeight * 0.1),
                              fixedSize: Size(screenWidth * 0.3, screenHeight * 0.08),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            )
          );
        },
      );
    }

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewVehicleEmission(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 172, 49, 49),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 99, 146, 38),
          foregroundColor: Colors.white,
          onPressed: () {
            selectVehicleBottomDialog(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: Material(
          elevation: 20,
          child: Container(
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
                      onPressed: (){},
                        child: Text(
                        'Cancel', 
                        style: TextStyle(
                          color: Color.fromARGB(255, 99, 146, 38), 
                          fontSize: 16,
                          fontWeight: FontWeight.bold)
                          ),
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
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
                      onPressed: (){},
                      child: Text(
                        'Save', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold)
                          ),
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
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
        ),
        body: Stack(
          children: [
            // create back button in top left corner and "Back" text
            Positioned(
              left: screenWidth * 0.02,
              top: screenHeight * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    // onPressed Navigate to home.dart
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 16,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.2,
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                height: screenHeight,
                width: screenWidth,
                child: Column(
                  // align start
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // text "Vehicle Emission"
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        bottom: 5
                      ),
                      child: Text(
                        'Vehicle Emission',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    // text "Vehicle Type"
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20
                      ),
                      child: Text(
                        'Please select your transport do you use most frequently.',
                        style: TextStyle(                        
                          fontSize: 16,
                          fontFamily: 'Poppins',                          
                          height: 0,
                        ),
                      ),
                    ),
                    // long button
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          selectVehicleBottomDialog(context);
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(3),
                          foregroundColor: MaterialStatePropertyAll<Color>(Colors.grey[600]!),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(125, 0, 0, 0),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(Size(screenWidth * 0.9, 35)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            "Select transport...",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    )
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
