import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app_bloc/model/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=a2d27e8c9f07077bf5f215cb90715c2c&units=metric";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return parsedJson(response.body);
    } else {
      throw Exception('Error response');
    }
  }

  WeatherModel parsedJson(final result) {
    final jsonDecoded = jsonDecode(result);
    final weatherValue = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonDecoded);
  }
}
