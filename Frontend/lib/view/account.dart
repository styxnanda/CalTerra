import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:calterra/api/apiService.dart';
import 'package:calterra/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

bool isLoading = false;

class _AccountState extends State<Account> {
  String? username = 'username';
  String? name = 'User';
  String? email = 'email';
  String? passwordHash;
  DateTime? dateJoined = DateTime.now();

  bool enableEdit = false;

  @override
  void initState()  {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchAccountMethod();
  }

  Future<void> fetchAccountMethod() async {
    Map<String, dynamic> account  = await fetchAccount();
    setState(() {
      username = account['username'];
      name = account['name'];
      email = account['email'];
      passwordHash = account['password_hash'];
      // convert dateJoined to DateTime, only take date, month, and year. Month is in english
      dateJoined = DateTime.parse(account['registration_date']);
      isLoading = false;
    });
  }

  Future<Map<String, dynamic>> fetchAccount() async{
    ApiService apiService = ApiService();
    Map<String, dynamic> accountResponse = {};
    http.Response response = await apiService.getData('account/user');
    debugPrint("Body: ${response.body}");
    if (response.statusCode == 200){
      accountResponse = jsonDecode(response.body);
      debugPrint("Account Response: ${accountResponse}");
      return accountResponse;
    } else {
      return accountResponse;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;    

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewAccount(),
      builder: (context, model, child) => Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xff639226),
            bottomNavigationBar: enableEdit ? 
            Material(
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
                            setState(() {
                              enableEdit = !enableEdit;
                            });
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
                          onPressed: (){
                            // createVehicleEmission(context, vehicleList);
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
            ) : 
            null,
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
                  top: screenHeight * 0.13,
                  // left: screenWidth * 0.05,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/image/user 1.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          width: screenWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(                          
                              'Member since ${DateFormat('dd MMMM yyyy').format(dateJoined!)}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,  
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),                
                          ],
                        ),
                      ],  
                    ),
                  ),
                
                ),          
                // create "Account" text
                Positioned(
                  top: screenHeight * 0.3,
                  child: Container(              
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.03,
                      right: screenWidth * 0.05,
                      left: screenWidth * 0.05,              
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20), 
                      ),
                    ),
                    height: screenHeight - screenHeight * 0.3,
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account Details',
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Username: ',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: TextFormField(
                                enabled: enableEdit,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '${username}',
                                  hintStyle: TextStyle(
                                    color: enableEdit ? Color(0xff000000) : Color(0xff92A0A9),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,  
                                  ),
                                ),
                              ),                          
                            ),
                          ]
                        ),
                        // create line
                        Divider(
                          color: Color(0xff92A0A9),
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email: ',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: TextFormField(
                                enabled: false,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '${email}',
                                  hintStyle: TextStyle(                                
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),                          
                            ),
                          ]
                        ),
                        // create line
                        Divider(
                          color: Color(0xff92A0A9),
                          thickness: 1,
                        ),                  
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Change Password',
                              style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.1,
                              child: IconButton(
                                onPressed: () {
                                  // Add your change password logic here
                                },
                                icon: Icon(Icons.arrow_forward_ios),
                                color: enableEdit ? Colors.black :  Color(0xff92A0A9),
                                iconSize: 16,                          
                              )            
                            ),
                          ]
                        ),
                        // create line
                        Divider(
                          color: Color(0xff92A0A9),
                          thickness: 1,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(                          
                              onPressed: () {
                                // Add your edit account logic here
                                setState(() {
                                  enableEdit = !enableEdit;
                                });
                              },
                              child: Text(enableEdit ? '' :'Edit account',
                                style: TextStyle(
                                  color: Color(0xff639226),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),                        
                            ),
                            TextButton(
                              onPressed: () {
                                // Add your logout logic here
                                logout();
                                Navigator.of(context).pushNamed(
                                      "startup",
                                    );
                              },
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
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
