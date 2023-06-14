import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isDarkMode = false,
  });

  final bool isDarkMode;

  HomeState copyWith({
    bool? isDarkMode,
  }) {
    return HomeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object?> get props => [isDarkMode];
}
