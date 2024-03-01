import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/helper/helper.dart';
import 'package:weather_app_bloc/screens/home_screen/home_scree.dart';
import 'package:weather_app_bloc/weather_bloc/weather_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Helper.determinePosition(),
      builder: (context, snapshot) {
        return BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
          child: const MaterialApp(home: HomeScreen()),
        );
      },
    );
  }
}
