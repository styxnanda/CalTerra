import 'dart:async';
import 'dart:convert';

import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_flight_emission.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
// import 'package:calterra/login.dart';
import 'package:http/http.dart' as http;

enum InputType { itinerary, flightDistance  }
enum FlightType { oneWay, returnTrip } 

class Airport {
  const Airport(this.airport, this.iata);

  final String airport;
  final String iata;

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      json['airport'] as String,
      json['iata'] as String,
    );
  }

}

Future<void> createFlightEmission(BuildContext context, InputType inputType,  String from, String to, FlightType flightType, String flightClass, {int distance = 0}) async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // String? cookie = preferences.getString('cookie');
  final ApiService api = ApiService();
  final response = await api.postRequest('calculation/flight', {
    if (inputType == InputType.itinerary) 'from': from,    
    if (inputType == InputType.itinerary) 'to': to,
    if (inputType == InputType.itinerary) 'trip_type': flightType == FlightType.oneWay ? 'one_way' : 'round',
    if (inputType == InputType.flightDistance) 'distance_op': distance.toString(),
    'flight_class': flightClass,
  },
    // urlEncoded: true,
  );

  if (response.statusCode == 200) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Flight emission created successfully.'),
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
    debugPrint("Body: ${response.body}");
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to create flight emission.'),
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


Future<List<Airport>> fetchAirports() async {
  final ApiService api = ApiService();
  final response = await api.getData('calculation/airport');

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<Airport> airports = jsonResponse.map((item) => Airport.fromJson(item)).toList();
    return airports;
  } else {
    throw Exception('Failed to load airports');
  }
}

class FlightEmission extends StatefulWidget {
  const FlightEmission({Key? key}) : super(key: key);

  @override
  State<FlightEmission> createState() => _FlightEmissionState();
}

class _FlightEmissionState extends State<FlightEmission>{
  final TextEditingController airportControllerFrom = TextEditingController();
  final TextEditingController airportControllerTo = TextEditingController();
  final TextEditingController flightClassController = TextEditingController();

  final TextEditingController distanceController = TextEditingController();

  InputType _inputType = InputType.itinerary;
  FlightType _flightType = FlightType.oneWay;
  List<Airport> airportList = []; 

  Airport? selectedFromAirport;
  Airport? selectedToAirport;

  String? flight_type = "one-way";
  String? flight_class = "";

  @override
  void initState() {
    super.initState();
    fetchAirports().then((airports) {
      setState(() {
        airportList = airports;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewFlightEmission(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 146, 160, 169), 
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
                    onPressed: (){
                      if (selectedFromAirport != null && selectedToAirport != null && _inputType == InputType.itinerary) {
                        createFlightEmission(context, _inputType, selectedFromAirport!.iata, selectedToAirport!.iata, _flightType, flight_class!);
                      } 
                      else if (distanceController.text.isNotEmpty && _inputType == InputType.flightDistance) {
                        createFlightEmission(context, _inputType, "", "", _flightType, flight_class!, distance: int.parse(distanceController.text));
                      }
                      else {
                        // Show a dialog or a snackbar to inform the user to select both airports
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Error'),
                              content: Text('Please select both airports.'),
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
        body: SingleChildScrollView(
          child: Container(
                width: screenWidth,
                height: screenHeight,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Color(0xFF92A0A9)),
                child: Stack(
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
                        width: screenWidth,
                        height: screenHeight * 0.8,
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: screenWidth * 0.06,
                              top: screenHeight * 0.02,
                              child: SizedBox(
                                width: screenWidth * 0.44,
                                // height: double.infinity,
                                child: Text(
                                  'Flight Emission',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: screenHeight * 0.06,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth * 1,
                                    child: ListTile(
                                      title: Text(
                                        'Select your flight itinerary',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                      ),
                                      leading: Radio<InputType>(
                                        activeColor: Color.fromARGB(255, 99, 146, 38),
                                        value: InputType.itinerary,
                                        groupValue: _inputType,
                                        onChanged: (InputType? value) {
                                          setState(() {
                                            _inputType = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 1,
                                    child: ListTile(
                                      // horizontalTitleGap: 14,
                                      leading: Text(
                                        'From: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                      ),
                                      title: DropdownMenu(
                                        key: ValueKey(1),
                                        width: screenWidth * 0.78,                                
                                        controller: airportControllerFrom,
                                        requestFocusOnTap: true,
                                        enableFilter: true,
                                        hintText: "Select Airport...",
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                          onSelected: (airport){
                                          setState(() {
                                            selectedFromAirport = airport;
                                            print(selectedFromAirport!.airport);
                                          });
                                        },
                                        dropdownMenuEntries: 
                                          airportList.map<DropdownMenuEntry<Airport>>((Airport airport) {
                                            return DropdownMenuEntry<Airport>(
                                              value: airport,
                                              label: airport.airport,
                                            );
                                          }).toList(),
                                        menuStyle: MenuStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          surfaceTintColor: MaterialStateProperty.all(Colors.white),
                                          maximumSize: MaterialStateProperty.all(Size(screenWidth * 0.78, 300)),
                                        ),
                                        inputDecorationTheme: InputDecorationTheme(                                    
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
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    width: screenWidth * 1,                            
                                    child: ListTile(
                                      horizontalTitleGap: 32,
                                      leading: Text(
                                        'To: ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                      ),
                                      title: DropdownMenu(
                                        key: ValueKey(2),
                                        width: screenWidth * 0.78,      
                                        menuHeight: 300,                          
                                        controller: airportControllerTo,
                                        enableFilter: true,
                                        requestFocusOnTap: true,
                                        hintText: "Select Airport...",
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                        onSelected: (airport){
                                          setState(() {
                                            selectedToAirport = airport;
                                            print(selectedToAirport!.airport);
                                          });
                                        },
                                        dropdownMenuEntries: 
                                          airportList.map<DropdownMenuEntry<Airport>>((Airport airport) {
                                            return DropdownMenuEntry<Airport>(
                                              value: airport,
                                              label: airport.airport,
                                            );
                                          }).toList(),
                                        menuStyle: MenuStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                          surfaceTintColor: MaterialStateProperty.all(Colors.white),
                                          maximumSize: MaterialStateProperty.all(Size(screenWidth * 0.78, 300)),
                                        ),
                                        inputDecorationTheme: InputDecorationTheme(                                    
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
                                      ),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      // two radio button
                                      SizedBox(
                                        width: screenWidth * 0.5,
                                        child: ListTile(
                                          title: Text(
                                            'Return Trip',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              height: 0,
                                            ),
                                          ),
                                          leading: Radio<FlightType>(
                                            activeColor: Color.fromARGB(255, 99, 146, 38),
                                            value: FlightType.returnTrip,
                                            groupValue: _flightType,
                                            onChanged: (FlightType? value) {
                                              setState(() {
                                                _flightType = value!;
                                                flight_type = "round";
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.5,
                                        child: ListTile(
                                          title: Text(
                                            'One-way Flight',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              height: 0,
                                            ),
                                          ),
                                          leading: Radio<FlightType>(
                                            activeColor: Color.fromARGB(255, 99, 146, 38),
                                            value: FlightType.oneWay,
                                            groupValue: _flightType,
                                            onChanged: (FlightType? value) {
                                              setState(() {
                                                _flightType = value!;
                                                flight_type = "one_way";
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: screenWidth * 1,                            
                                    child: ListTile(
                                      title: Text(
                                        'Or enter the estimated distance of your flight',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                      ),
                                      leading: Radio<InputType>(
                                        activeColor: Color.fromARGB(255, 99, 146, 38),
                                        value: InputType.flightDistance,
                                        groupValue: _inputType,
                                        onChanged: (InputType? value) {
                                          setState(() {
                                            _inputType = value!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: screenWidth * 0.06,
                                      right: screenWidth * 0.06,
                                    ),
                                    width: screenWidth * 0.9,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: distanceController,
                                      decoration: InputDecoration(
                                        hintText: 'Distance (km)',
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
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
                                          vertical: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // flight class
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: screenWidth * 0.06,
                                      right: screenWidth * 0.06,
                                      top: screenHeight * 0.02,
                                    ),
                                    child: Text(
                                      'Flight Class',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: screenWidth * 1,
                                    margin: EdgeInsets.only(
                                      left: screenWidth * 0.02,
                                      right: screenWidth * 0.06,
                                    ),
                                    child: ListTile(
                                      title: DropdownButtonFormField(
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          height: 0,
                                        ),
                                        hint: Text('Select Class'),
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
                                            child: Text('Economy'),
                                            value: 'economy',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('Business'),
                                            value: 'business',
                                          ),
                                          DropdownMenuItem(
                                            child: Text('First'),
                                            value: 'first',
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            flight_class = value.toString();
                                          });                                        
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                                )
                            ),
                          ]
                        ),
                      ),
                    ),
                  ],
                ),
              ), 
          ),
      ),
    );
  }
}