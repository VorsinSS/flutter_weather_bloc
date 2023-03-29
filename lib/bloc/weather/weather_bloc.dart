import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/model/weather_model.dart';
import 'package:weather_app_bloc/repo/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherNotSearched()) {
    on<FetchWeather>(_fetchWeather);
    on<ResetWeather>(_resetWeather);
  }

  void _fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    WeatherModel weather = await weatherRepo.getWeather(event._city);

    emit(WeatherLoaded(weather));
  }

  void _resetWeather(ResetWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherNotSearched());
  }
}
