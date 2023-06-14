import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/my_app_event.dart';
import 'package:flutter_switch_theme/src/my_app_state.dart';
import 'package:flutter_switch_theme/src/utils/preference_util.dart';

const keyIsDark = 'is_dark';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc()
      : super(MyAppState(themeData: ThemeData.light(useMaterial3: true))) {
    on<MyAppInitEvent>(_onInit);
    on<MyAppThemeChangedEvent>(_onChange);
  }

  void _onInit(MyAppInitEvent event, Emitter<MyAppState> emit) async {
    final isDark = await PreferenceUtil.getBoolean(keyIsDark);
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

  void _onChange(MyAppThemeChangedEvent event, Emitter<MyAppState> emit) async {
    final isDark = event.isDark;
    PreferenceUtil.setBoolean(keyIsDark, isDark);
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
