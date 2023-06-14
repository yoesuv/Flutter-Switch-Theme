import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyAppState extends Equatable {
  const MyAppState({
    required this.themeData,
  });

  final ThemeData themeData;

  MyAppState copyWith({
    ThemeData? themeData,
  }) {
    return MyAppState(
      themeData: themeData ?? this.themeData,
    );
  }

  @override
  List<Object?> get props => [
        themeData,
      ];
}
