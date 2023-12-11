import 'dart:async';
import 'dart:convert';
import 'package:calterra/api/apiService.dart';
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

Future<void> login(BuildContext context, String username, String password) async {
  final ApiService apiService = ApiService();
  final response = await apiService.postRequest(
    'account/login/local',
    {
      'username': username,
      'password': password,
    },
    urlEncoded: true,
  );

  debugPrint("Body: ${response.body}");
  debugPrint("Code: ${response.statusCode}");

  if (response.statusCode == 200) {
    // Successful login logic
    _showDialog(context, "Login Success", "You have successfully logged in", () {
      Navigator.of(context).pushNamed("home");
    });
    String? cookie = response.headers['set-cookie'];
    if (cookie != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('cookie', cookie);
    }
  } else {
    // Failed login logic
    _showDialog(context, "Login Failed", "Failed to log in", () {
      Navigator.of(context).pop();
    });
  }
}

void _showDialog(BuildContext context, String title, String content, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: onPressed, child: Text("OK"))
      ],
    )
  );
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
