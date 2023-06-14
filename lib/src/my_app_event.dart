import 'package:equatable/equatable.dart';

abstract class MyAppEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyAppInitEvent extends MyAppEvent {}

class MyAppThemeChangedEvent extends MyAppEvent {
  MyAppThemeChangedEvent({
    required this.isDark,
  });
  final bool isDark;
  @override
  List<Object?> get props => [isDark];
}
