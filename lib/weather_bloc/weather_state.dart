part of 'weather_bloc.dart';

@immutable
sealed class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherFailure extends WeatherState {}

final class WeatherSuccesses extends WeatherState {
  final Weather weather;

  WeatherSuccesses({required this.weather});
  @override
  List<Object?> get props => [weather];
}
