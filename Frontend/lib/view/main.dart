import 'package:calterra/routing.dart';
import 'package:calterra/view/account.dart';
import 'package:calterra/view/home.dart';
import 'package:flutter/material.dart';
import 'package:calterra/view/startup.dart';
import 'package:calterra/view/flightEmission.dart';
import 'package:calterra/view/vehicleEmission.dart';
import 'package:calterra/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
      home: Startup(),
    );
  }
}
