import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';
import 'package:weather_app_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_app_bloc/model/weather_model.dart';

class ShowWeather extends StatelessWidget {
  ShowWeather({Key? key, required this.city, required this.weatherForecast})
      : super(key: key);
  WeatherModel weatherForecast;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          city.toString().titleCase,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "${weatherForecast.main.temp.round()} °C",
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const Text(
          "Сейчас",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "${weatherForecast.main.tempMin.round()} °C",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Мин.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${weatherForecast.main.tempMax.round()} °C",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "Макс.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 40),
        SizedBox(
            height: 40,
            width: 250,
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                },
                child: const Text(
                  "Search Again",
                  style: TextStyle(fontSize: 16),
                )))
      ],
    );
  }
}
