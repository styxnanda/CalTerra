import 'package:flutter/material.dart';

class ViewVehicleEmission extends ChangeNotifier {
  List<Widget> _widgetList = [];

  List<Widget> get widgetList => _widgetList;

  void addWidget(Widget widget) {
    _widgetList.add(widget);
    notifyListeners();
  }
}