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
                Navigator.of(context).pushNamed(
                  "homeEmission",
                );
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
                  onPressed: () {},
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
