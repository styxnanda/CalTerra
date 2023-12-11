import 'package:calterra/view/foodEmission.dart';
import 'package:calterra/view/history.dart';
import 'package:calterra/view/homeEmission.dart';
import 'package:calterra/view/login.dart';
import 'package:calterra/view/register.dart';
import 'package:calterra/view/home.dart';
import 'package:calterra/view/account.dart';
import 'package:calterra/view/flightEmission.dart';
import 'package:calterra/view/rehome.dart';
import 'package:calterra/view/vehicleEmission.dart';
import 'package:calterra/view/startup.dart';  
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "startup":
      return PageTransition(
        child: const Startup(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "login":
      return PageTransition(
        child: const Login(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "register":
      return PageTransition(
        child: const Register(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "home":
      return PageTransition(
        child: const Home(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "account":
      return PageTransition(
        child: const Account(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "flightEmission":
      return PageTransition(
        child: const FlightEmission(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "vehicleEmission":
      return PageTransition(
        child: const VehicleEmission(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "foodEmission":
      return PageTransition(
        child: const FoodEmission(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "homeEmission":
      return PageTransition(
        child: const HomeEmission(),
        type: PageTransitionType.topToBottom,
        settings: settings, 
      );
    case "history":
      return PageTransition(
        child: const History(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    case "rehome":
      return PageTransition(
        child: const HomeView(),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
    default:
      return PageTransition(
        child: const Text("Not Found"),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
  }
}
