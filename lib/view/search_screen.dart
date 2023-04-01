import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_bloc/bloc/weather/weather_bloc.dart';
import 'package:weather_app_bloc/view/show_weather.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController weatherController = TextEditingController();
  final String assetName = 'assets/weather.svg';

  @override
  void initState() {
    super.initState();
    weatherController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(221, 44, 44, 44),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                assetName,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            const SizedBox(
              height: 113,
              width: 135,
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherNotSearched) {
                  return Column(
                    children: [
                      const Text(
                        "Погода",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            onFieldSubmitted: (value) => weatherBloc.add(
                                FetchWeather(
                                    weatherController.text.toString())),
                            controller: weatherController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(255, 100, 100, 100),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintText: "Город",
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(style: BorderStyle.none),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  borderSide:
                                      BorderSide(style: BorderStyle.none)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                weatherBloc.add(FetchWeather(
                                    weatherController.text.toString()));
                              },
                              child: const Text(
                                "Найти",
                                style: TextStyle(fontSize: 16),
                              ))),
                    ],
                  );
                } else if (state is WeatherLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else if (state is WeatherLoaded) {
                  return ShowWeather(
                      weatherForecast: state.getWeather,
                      city: weatherController.text.toString());
                } else {
                  return const Text("Error");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

_getWeatherIcon(String icon) {
  switch (icon) {
    case '01d':
      return "assets/sun.svg";
    case '01n':
      return "assets/sun.svg";
    case '02d':
    case '02n':
    case '03d':
    case '03n':
    case '04d':
    case '04n':
      return "assets/cloudy.svg";
    case '09d':
    case '09n':
    case '10d':
    case '10n':
      return "assets/rainy.svg";
    case '11d':
    case '11n':
      return "assets/stormy.svg";
    case '13d':
    case '13n':
      return "assets/snowy.svg";
    case '50d':
    case '50n':
      return "assets/mist.png";
  }
}
