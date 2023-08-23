import 'package:flutter/material.dart';
import 'package:local_postman/screens/homepage.dart';

class NavigationProvider extends ChangeNotifier {
  late Widget _currentWidget;

  Widget get currentWidget => _currentWidget;

  NavigationProvider() {
    _currentWidget = const HomePage();
  }

  set currentWidget(Widget value) {
    _currentWidget = value;
    notifyListeners();
  }
}
