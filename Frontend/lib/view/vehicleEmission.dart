import 'dart:async';
import 'dart:convert';

import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_vehicle_emission.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

bool isLoading = false;

Future logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('cookie');
}

class VehicleEmission extends StatefulWidget {
  const VehicleEmission({Key? key}) : super(key: key);

  @override
  State<VehicleEmission> createState() => _VehicleEmissionState();

  
}

Future<void> createVehicleEmission(BuildContext context, List<Map<String, dynamic>> vehicleList) async {
  // list of response code
  List<int> responseCode = [];
  if (vehicleList.length == 0) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Please add at least one vehicle.'),
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
    return;
  }
  final ApiService apiService = ApiService();
  // create response for every vehicle
  for (var vehicle in vehicleList) {
    // print vehicle
    debugPrint("Request Body: $vehicle");
    final response = await apiService.postRequest(
      'calculation/vehicle',
      {
        'vehicle_type': vehicle['vehicle'],
        'distance': vehicle['distance_controller'].text.toString(),
        if (vehicle['vehicle'] == 'Car') 'fuel_type': vehicle['fuel_type'],
        if (vehicle['vehicle'] == 'Car') 'vehicle_size': vehicle['vehicle_size'],
      },
    );
    debugPrint("Body: ${response.body}");
    debugPrint("Code: ${response.statusCode}");
    responseCode.add(response.statusCode);
  }
  // check if all response code is 200
  if (responseCode.every((element) => element == 200)) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Vehicle emission created successfully.'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pushNamed("history");
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
          content: Text('Failed to create vehicle emission.'),
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

class _VehicleEmissionState extends State<VehicleEmission> {
  // List<Widget> vehicleWidgetList = [];
  final List<Map<String, dynamic>> vehicleList = [];
  int vehicleIndex = 0;

  String fuel_type = '';
  String vehicle_size = '';
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Widget vehicleWidget(Map<String, dynamic> vehicle) {
      String imageUrl = '';
      int colorValue = 0;

      int index = vehicle['index'];

      switch (vehicle['vehicle']) {
        case 'Car':
          imageUrl = 'assets/image/front-car.png';
          colorValue = 0xFFFF4208;
          break;
        case 'Bus':
          imageUrl = 'assets/image/front-bus.png';
          colorValue = 0xFF023047;
          break;
        case 'Train':
          imageUrl = 'assets/image/front-train.png';
          colorValue = 0xFF6CA2EA;
          break;
        case 'Motorbike':
          imageUrl = 'assets/image/front-motor.png';
          colorValue = 0xFFFED23F;
          break;
        case 'Electric Bicycle':
          imageUrl = 'assets/image/electric-cycle.png';
          colorValue = 0xFF7DBD2B; 
          break;
        default:
          imageUrl = 'assets/image/front-car.png';
          colorValue = 0xFFFF4208;
      }

      // TODO: build widget for each vehicle
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
                        color: Color(colorValue),
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
                        Text(vehicle['vehicle'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          "How far do you travel with this transportation?", 
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal)
                        ),
                      ],
                    )
                  ],
                ),
                Container(    
                  margin: EdgeInsets.only(top: 10),              
                  height: 32, // You can adjust this as needed
                  width: screenWidth * 0.7,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    // print TextEditingController.text,
                    onChanged: (value) {
                      print(vehicle['distance_controller'].text);
                    },
                    controller: vehicle['distance_controller'],
                    decoration: InputDecoration(                     
                      hintText: 'Distance (km)',
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
                // if vehicle is "Car", add more text field 
                if (vehicle['vehicle'] == 'Car')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 5),
                        child: Text("Details", style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 5),              
                        height: 32, // You can adjust this as needed
                        width: screenWidth * 0.7,                      
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text('Fuel Type:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                          title: DropdownButtonFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            height: 0,
                          ),
                          hint: Text('Fuel Type...'),
                          onChanged: (value) {                            
                            setState(() {
                              fuel_type = value.toString();
                              vehicle['fuel_type'] = fuel_type;
                              print(vehicle['fuel_type']);
                            });
                          },
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
                              child: Text('Petrol'),
                              value: 'Petrol',
                            ),
                            DropdownMenuItem(
                              child: Text('Diesel'),
                              value: 'Diesel',
                            ),
                            DropdownMenuItem(
                              child: Text('Hybrid'),
                              value: 'Hybrid',
                            ),
                            DropdownMenuItem(
                              child: Text('Battery Electric Vehicle'),
                              value: 'Battery Electric Vehicle',
                            ),
                            DropdownMenuItem(
                              child: Text('Plug-in Hybrid Electric Vehicle'),
                              value: 'Plug-in Hybrid Electric Vehicle',
                            ),
                            DropdownMenuItem(
                              child: Text('Unknown'),
                              value: 'Unknown',
                            ),
                          ],
                        ),
                        ),                        
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, left: 5),              
                        height: 32, // You can adjust this as needed
                        width: screenWidth * 0.7,                      
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text('Car Size:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
                          title: DropdownButtonFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            height: 0,
                          ),
                          hint: Text('Car Size...'),
                          onChanged: (value) {
                            vehicle_size = value.toString();  
                            vehicle['vehicle_size'] = vehicle_size;
                            print(vehicle['vehicle_size']);
                          },
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
                              child: Text('Small'),
                              value: 'Small',
                            ),
                            DropdownMenuItem(
                              child: Text('Medium'),
                              value: 'Medium',
                            ),
                            DropdownMenuItem(
                              child: Text('Large'),
                              value: 'Large',
                            ),
                          ],
                        ),
                        ),
                      ),
                    ],
                    )
              ],
            ),
                       
            IconButton(
              onPressed: () {
                setState(() {
                  vehicleList.remove(vehicle);
                  print(vehicleList);                  
                });
              },
              icon: Icon(Icons.delete),
            )
          ],
        ),
      );
    }

    // List<bool> isSelected = [true, false, false, false, false];

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
                              setState(() {    
                                vehicleList.add({
                                  'index': vehicleIndex,
                                  'vehicle': 'Car',
                                  'distance_controller': TextEditingController(),
                                  'fuel_type': 'Petrol',
                                  'vehicle_size': 'Small',
                                });
                                vehicleIndex++;
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
                              setState(() {    
                                vehicleList.add({
                                  'index': vehicleIndex,
                                  'vehicle': 'Bus',
                                  'distance_controller': TextEditingController(),
                                  'fuel_type': '',
                                  'vehicle_size': '',
                                });
                                vehicleIndex++;
                              });
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
                              setState(() {    
                                vehicleList.add({
                                  'index': vehicleIndex,
                                  'vehicle': 'Train',
                                  'distance_controller': TextEditingController(),
                                  'fuel_type': '',
                                  'vehicle_size': '',
                                });
                                vehicleIndex++;
                              });
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
                              setState(() {    
                                vehicleList.add({
                                  'index': vehicleIndex,
                                  'vehicle': 'Motorbike',
                                  'distance_controller': TextEditingController(),
                                  'fuel_type': '',
                                  'vehicle_size': '',
                                });
                                vehicleIndex++;
                              });
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
                              setState(() {    
                                vehicleList.add({
                                  'index': vehicleIndex,
                                  'vehicle': 'Electric Bicycle',
                                  'distance_controller': TextEditingController(),
                                  'fuel_type': '',
                                  'vehicle_size': '',
                                });
                                vehicleIndex++;
                              });
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
      builder: (context, model, child) => Stack(
        children: [
          Scaffold(
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
                          onPressed: (){
                            Navigator.of(context).pop(); 
                          },
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
                          onPressed: () async{
                            setState(() {
                              isLoading = true;
                            });
                            await createVehicleEmission(context, vehicleList);
                            setState(() {
                              isLoading = false;
                            });
                          },
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
                          // back
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
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: screenHeight * 0.5,
                            child: ListView.builder(
                              itemCount: vehicleList.length,
                              itemBuilder: (context, index) {
                                print(vehicleList);
                                var vehicle = vehicleList[index];
                                print(vehicle);
                                return vehicleWidget(vehicle);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                )
              ],
            )
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
      ),
    );
  }
}
