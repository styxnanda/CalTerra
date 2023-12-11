import 'package:calterra/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:calterra/viewModel/view_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; 

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

Future logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('cookie');
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewAccount(),
      builder: (context, model, child) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SizedBox(
            height: AppBar().preferredSize.height,
            width: AppBar().preferredSize.width,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.add,
                ),
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
                    icon: const Icon(
                      Icons.home,
                    ),
                    onPressed: () {
                      debugPrint("Jlana");
                      Navigator.of(context).pushNamed(
                        "home",
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_month_rounded,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.group_rounded,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_rounded,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Container(
            width: screenWidth,
            height: screenHeight,
            color: Color.fromARGB(255, 99, 146, 38),
            child: Stack(
              children: [
                Positioned(
                      left: screenWidth * 0.02,
                      top: screenHeight * 0.05,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            // onPressed Navigate to home.dart
                            onPressed: () {
                              logout();
                              // clear cookie, go to startup page
                              Navigator.of(context).pushNamed(
                                "startup",
                              );

                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                            iconSize: 16,
                          ),
                          Text(
                            'Logout',
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
                // text to display account name
                Positioned(
                    top: screenHeight * 0.1,
                    left: screenWidth * 0.05,
                    child: SizedBox(
                      width: screenWidth,
                      child: ListTile(
                        title: Text(
                          "Account Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "Account Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        // profile picture
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/image/Logo.png"),
                        ),
                      ),
                    )),
                Positioned(
                  // put at the bottom
                  top: screenHeight * 0.25,
                  child: Container(
                    width: screenWidth * 0.98,
                    height: screenHeight * 0.75,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    // border radius
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ))),
                  ),
                )
              ],
            ),
          ))),
    );
  }
}
