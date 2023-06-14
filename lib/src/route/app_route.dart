import 'package:flutter/material.dart';
import 'package:flutter_switch_theme/src/menu/home_screen.dart';

class AppRoute {
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Page Not Found'),
            ),
          );
        });
    }
  }
}
