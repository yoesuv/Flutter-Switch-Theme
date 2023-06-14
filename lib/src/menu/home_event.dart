import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeSwitchChangedEvent extends HomeEvent {
  HomeSwitchChangedEvent({required this.value});
  final bool value;
  @override
  List<Object?> get props => [value];
}
