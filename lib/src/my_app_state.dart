import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyAppState extends Equatable {
  const MyAppState({
    required this.themeData,
    this.isDark = false,
  });

  final bool isDark;
  final ThemeData themeData;

  MyAppState copyWith({
    ThemeData? themeData,
    bool? isDark,
  }) {
    return MyAppState(
      themeData: themeData ?? this.themeData,
      isDark: isDark ?? this.isDark,
    );
  }

  @override
  List<Object?> get props => [
        themeData,
        isDark,
      ];
}
