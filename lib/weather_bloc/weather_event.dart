// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object?> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
 final Position position;
  const FetchWeatherEvent({
    required this.position,
  });
@override
  List<Object?> get props => [position];

  
}
