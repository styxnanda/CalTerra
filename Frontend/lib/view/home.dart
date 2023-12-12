import 'package:calterra/viewModel/view_home.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
                              setState(() {    
                                // emissionList.add('Train');
                                Navigator.of(context).pushNamed(
                                  "homeEmission",
                                );
                              });
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

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewHome(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.tealAccent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 100,
          width: 50,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {                
                selectEmissionsBottomDialog(context);
              },
              child: Icon(
                Icons.add,
              ),
              elevation: 6.0,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/image/Header.png"),
                        fit: BoxFit.cover),
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: -1,
                          blurRadius: 8.0,
                          offset: Offset(
                            -1,
                            5,
                          )),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          "Welcome, to Calterra",
                        ),
                      )
                    ],
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
