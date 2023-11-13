import 'package:calterra/viewModel/view_login.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                              decoration: InputDecoration(hintText: "Email"),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Username"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Password"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
