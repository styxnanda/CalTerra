import 'package:calterra/routing.dart';
import 'package:calterra/view/account.dart';
import 'package:calterra/view/foodEmission.dart';
import 'package:calterra/view/history.dart';
import 'package:calterra/view/home.dart';
import 'package:calterra/view/homeEmission.dart';
import 'package:calterra/view/login.dart';
import 'package:calterra/view/rehome.dart';
import 'package:flutter/material.dart';
import 'package:calterra/view/startup.dart';
import 'package:calterra/view/flightEmission.dart';
import 'package:calterra/view/vehicleEmission.dart';
import 'package:calterra/view/login.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CalTerra Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      home: Startup(),
    );
  }
}
