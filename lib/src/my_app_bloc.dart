import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_event.dart';
import 'package:flutter_switch_theme/src/my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc()
      : super(MyAppState(themeData: ThemeData.light(useMaterial3: true))) {
    on<MyAppInitEvent>(_onInit);
    on<MyAppThemeChangedEvent>(_onChange);
  }

  void _onInit(MyAppInitEvent event, Emitter<MyAppState> emit) {}

  void _onChange(MyAppThemeChangedEvent event, Emitter<MyAppState> emit) {
    final isDark = event.isDark;
    if (isDark) {
      emit(state.copyWith(
        isDark: true,
        themeData: ThemeData.dark(useMaterial3: true),
      ));
    } else {
      emit(state.copyWith(
        isDark: false,
        themeData: ThemeData.light(useMaterial3: true),
      ));
    }
  }
}
