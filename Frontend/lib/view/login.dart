import 'dart:async';
import 'dart:convert';

import 'package:calterra/viewModel/view_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});
  
  
  @override
  State<Login> createState() => _LoginState();
}

Future<http.Response> login (BuildContext context, username, String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:4322/account/login/local'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'username': username,
        'password': password,
      },
    ),
  );

  if (response.statusCode == 200) {
    showDialog(
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        title: Text("Login Success"),
        content: Text("You have successfully logged in"),
        actions: [
          TextButton(
            onPressed: () {
              // navigate to home
              Navigator.of(context).pushNamed(
                "home",
              );
            }, 
            child: Text("OK")
          )
        ],
      )
    );
    String? cookie = response.headers['set-cookie'];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('cookie', cookie!);
    return response;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    showDialog(
      context: context, 
      builder: (BuildContext context) => AlertDialog(
        title: Text("Login Failed"),
        content: Text("You have failed to log in"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            }, 
            child: Text("OK")
          )
        ],
      )
      );
    throw Exception(response.body);
  }
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();  

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ViewLogin(),
      builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 70,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 2.0,
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(hintText: "Username"),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            username = _usernameController.text;
                            password = _passwordController.text;
                            login(context, username, password);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account yet?"),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            "register",
                          );
                        },
                        child: Text("Click here"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1.5,
                      ),
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.white,
                          child: Text("OR")),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          'assets/image/google.png',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Login with Google",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
