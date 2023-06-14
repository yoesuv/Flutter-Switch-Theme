import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch_theme/src/menu/home_event.dart';
import 'package:flutter_switch_theme/src/menu/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeInitEvent>(_onInit);
    on<HomeSwitchChangedEvent>(_onSwitchChanged);
  }

  void _onInit(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      isDarkMode: false,
    ));
  }

  void _onSwitchChanged(
    HomeSwitchChangedEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(
      isDarkMode: event.value,
    ));
  }
}
