import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MyAppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyAppInitEvent extends MyAppEvent {}

class MyAppThemeChangedEvent extends MyAppEvent {
  MyAppThemeChangedEvent({
    required this.themeData,
  });
  final ThemeData themeData;
  @override
  List<Object?> get props => [
        themeData,
      ];
}
