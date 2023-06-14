import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MyAppState extends Equatable {
  const MyAppState({
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  List<Object?> get props => [
        themeData,
      ];
}
