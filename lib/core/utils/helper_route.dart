
import 'package:flutter/material.dart';

import '../../presentation/screens/home/widget/home.dart';
class HelperRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
        return MaterialPageRoute(
      builder: (context) => _getRoute(settings),
      settings: settings,
    );
  }

  static Widget _getRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return const Home();
    }
  }
}
