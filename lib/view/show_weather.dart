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
          // city.toString().titleCase,
          weatherForecast.name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('${weatherForecast.weather[0].description}'),
        const SizedBox(
          height: 15,
        ),
        Text(
          "${weatherForecast.main.temp.round()} °C",
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Сейчас",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                  "${weatherForecast.main.feelsLike.round()} °C",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Ощущается как",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${weatherForecast.wind.speed.round()} м/с",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Скорость ветра",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
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
                  "Назад",
                  style: TextStyle(fontSize: 16),
                )))
      ],
    );
  }
}
