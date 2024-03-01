import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_bloc/data/api_key.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherEvent>(_fetchWeather);
  }

  FutureOr<void> _fetchWeather(
      FetchWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      WeatherFactory wf =
          WeatherFactory(openWeatherApiKey, language: Language.ENGLISH);
      // Position position = await Geolocator.getCurrentPosition();

      Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude, event.position.longitude);


      emit(
        WeatherSuccesses(weather: weather),
      );
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
