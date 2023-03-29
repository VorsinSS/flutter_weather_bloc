import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_app_bloc/repo/weather_repo.dart';
import 'package:weather_app_bloc/view/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(221, 44, 44, 44),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        hintColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 34, 34, 34),
            foregroundColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(weatherRepo: WeatherRepo()),
        child: const SearchScreen(),
      ),
    );
  }
}
