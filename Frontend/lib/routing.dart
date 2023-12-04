import 'package:calterra/view/login.dart';
import 'package:calterra/view/register.dart';
import 'package:calterra/view/home.dart';
import 'package:calterra/view/account.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
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
    default:
      return PageTransition(
        child: const Text("Not Found"),
        type: PageTransitionType.topToBottom,
        settings: settings,
      );
  }
}
