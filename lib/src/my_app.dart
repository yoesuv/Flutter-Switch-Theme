import 'package:flutter/material.dart';
import 'package:flutter_switch_theme/src/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Switch Theme',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRoute.routes,
      themeMode: ThemeMode.dark,
    );
  }
}
