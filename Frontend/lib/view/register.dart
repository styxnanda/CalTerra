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
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Username"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Register with Google",
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
