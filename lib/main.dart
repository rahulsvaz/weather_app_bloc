import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc/helper/helper.dart';
import 'package:weather_app_bloc/screens/home_screen/home_screen.dart';
import 'package:weather_app_bloc/weather_bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Helper.determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBloc>(
              create: (context) => WeatherBloc()
                ..add(
                  FetchWeatherEvent(position: snapshot.data as Position),
                ),
              child: const HomeScreen(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

class WT extends StatelessWidget {
  const WT({super.key});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
