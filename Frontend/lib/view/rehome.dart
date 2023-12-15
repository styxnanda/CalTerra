import 'dart:convert';
import 'package:calterra/api/apiService.dart';
import 'package:calterra/components/contributionBarChart.dart';
import 'package:calterra/viewModel/emission_data.dart';
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
  EmissionData? thisEmissionData;

  @override
  initState() {
    super.initState();
    fetchUsernameMethod();
    fetchEmissionData();
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
      throw Exception(
          'Failed to fetch user id with error code: ${response.statusCode}');
    }
  }

  void fetchEmissionData() async {
    ApiService apiService = ApiService();
    http.Response response = await apiService.getData('account/user/change');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        thisEmissionData = EmissionData.fromJson(data);
      });
    } else {
      throw Exception(
          'Failed to fetch emission data with error code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    void selectEmissionsBottomDialog(BuildContext context){
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
                          'Select Emissions Type', 
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
                                // emissionList.add('Car');                              
                              });
                              // Navigator.pop(context);
                                Navigator.of(context).pushNamed(
                                  "flightEmission",
                                );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                
                                Image.asset('assets/image/plane.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                     
                                Text(
                                  'Flight Emission',
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
                              backgroundColor: Color(0xFF92A0A9),
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
                                // emissionList.add('Bus');
                              });
                              // Navigator.pop(context);
                                Navigator.of(context).pushNamed(
                                  "vehicleEmission",
                                );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/front-car.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                  
                                Text(
                                  'Vehicle Emission',
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
                              backgroundColor: Color(0xFFAC3131),
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
                                  Navigator.of(context).pushNamed(
                                  "homeEmission",
                              );
                              // Navigator.pop(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/House.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                    
                                Text(
                                  'House Emissions',
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
                              backgroundColor: Color(0xFF217CB2),
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
                                // emissionList.add('Motorbike');
                                    // Navigator.of(context).pushNamed(
                                //   "homeEmission",
                                // );
                              });
                              // Navigator.pop(context);
                                Navigator.of(context).pushNamed(
                                  "foodEmission",
                                );
                              
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[  
                                Image.asset('assets/image/cutlery.png', height: 50, width: 50),
                                SizedBox(height: 5),                                                 
                                Text(
                                  'Food Emission',
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
                              backgroundColor: Color(0xFFC5B319),
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
                  SizedBox(height: 20),
                  Row(children: [
                    SizedBox(width: 20),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome, ',
                          ),
                          TextSpan(
                              text: thisUsername ?? 'User',
                              style: TextStyle(
                                  color: Color.fromRGBO(125, 189, 43, 1))),
                          TextSpan(text: '!'),
                        ]))
                  ]),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                          'Your latest carbon footprint: ${thisEmissionData?.latestMonth.monthlyTotalEmission ?? 'N/A'} kg',
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 14,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Change: ',
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontSize: 14,
                          )),
                      Text(
                        thisEmissionData?.change != null
                            ? '${thisEmissionData!.change!.sign > 0 ? '+' : ''}${thisEmissionData!.change} kg'
                            : 'N/A',
                        style: TextStyle(
                          color: thisEmissionData?.change?.sign == 1
                              ? Colors.red
                              : Colors.green,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        thisEmissionData?.change?.sign == 1
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        color: thisEmissionData?.change?.sign == 1
                            ? Colors.red
                            : Colors.green,
                        size: 14,
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 100,
                    child: EmissionChart(),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lightbulb, color: Colors.yellow, shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Color.fromRGBO(151, 151, 151, 1),
                          offset: Offset(1.0, 1.0),
                        ),
                      ],),
                      SizedBox(width: 5,),
                      Flexible(child: Text('Buying from local merchant reduces carbon footprint!'
                      , style: TextStyle(
                        color: Color.fromRGBO(151, 151, 151, 1),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        fontSize: 10,
                      ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          selectEmissionsBottomDialog(context);
        },
        shape: CircleBorder(),
        foregroundColor: Colors.green,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset('assets/image/HomeAddIcon.png', width: 20, height: 20),
          Text('ADD',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(99, 146, 38, 1),
                  fontFamily: 'Poppins'))
        ]),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: AppBar().preferredSize.height,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_month_rounded,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "history",
                  );
                },
              ),
              SizedBox(
                width: 9,
              ),
              IconButton(
                icon: Icon(
                  Icons.group_rounded,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    "account",
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person_rounded,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
