import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_event.dart';
import 'package:flutter_switch_theme/src/my_app_state.dart';
import 'package:flutter_switch_theme/src/route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MyAppBloc()..add(MyAppInitEvent())),
      ],
      child: BlocBuilder<MyAppBloc, MyAppState>(
        buildWhen: (prev, current) => prev.isDark != current.isDark,
        builder: (context, state) {
          final brightness = state.isDark ? Brightness.dark : Brightness.light;
          final colorScheme = ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: brightness,
          );
          final Color textColor = state.isDark ? Colors.white : Colors.black;

          return MaterialApp(
            title: 'Flutter Switch Theme',
            theme: state.themeData.copyWith(
              brightness: brightness,
              colorScheme: colorScheme,
              // Ensure text colors follow the active ColorScheme for both light/dark
              textTheme: state.themeData.textTheme.apply(
                bodyColor: textColor,
                displayColor: textColor,
              ),
              scaffoldBackgroundColor: state.isDark
                  ? Colors.grey[900]
                  : Colors.grey[100],
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle.light,
              ),
              switchTheme: const SwitchThemeData(
                trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
              ),
            ),
            onGenerateRoute: AppRoute.routes,
          );
        },
      ),
    );
  }
}
