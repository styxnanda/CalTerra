import 'dart:async';
import 'dart:convert';
import 'package:calterra/api/apiService.dart';
import 'package:calterra/viewModel/view_login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

Future<void> register(BuildContext context, String email, String username,
    String name, String password) async {
  final ApiService apiService = ApiService();
  final response = await apiService.postRequest(
      "account/register",
      {
        'email': email,
        'username': username,
        'name': name,
        'password': password,
      },
      urlEncoded: true);

  if (response.statusCode == 200) {
    _showDialog(context, "Register Success", "You have successfully registered",
        () {
      Navigator.of(context).pushNamed("login");
    });
  } else {
    _showDialog(context, "Register Failed", "Failed to register", () {
      Navigator.of(context).pop();
    });
  }
}

void _showDialog(BuildContext context, String title, String content,
    VoidCallback onPressed) {
  showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [TextButton(onPressed: onPressed, child: Text("OK"))],
          ));
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  String email = "";
  String username = "";
  String name = "";
  String password = "";

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

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
              Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Icon(
                  Icons.app_registration,
                  size: 70,
                ),
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
                          controller: _emailController,
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(hintText: "Username"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(hintText: "Name"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          obscureText: _obscurePassword,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            email = _emailController.text;
                            username = _usernameController.text;
                            name = _nameController.text;
                            password = _passwordController.text;
                            register(context, email, username, name, password);
                          },
                          child: Text(
                            "Register",
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
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            "login",
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
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Register with Google",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      )
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
