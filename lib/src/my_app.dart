import 'package:flutter/material.dart';
import 'package:flutter_switch_theme/src/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Switch Theme',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.routes,
    );
  }
}
