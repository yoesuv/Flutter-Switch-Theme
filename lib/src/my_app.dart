import 'package:flutter/material.dart';
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
        builder: (context, state) => MaterialApp(
          title: 'Flutter Switch Theme',
          theme: state.themeData.copyWith(
            brightness: state.isDark ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor:
                state.isDark ? Colors.grey[900] : Colors.grey[100],
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
            ),
          ),
          onGenerateRoute: AppRoute.routes,
        ),
      ),
    );
  }
}
