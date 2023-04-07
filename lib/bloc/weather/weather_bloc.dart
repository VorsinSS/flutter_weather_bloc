import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc/model/weather_model.dart';
import 'package:weather_app_bloc/repo/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(const WeatherState()) {
    on<FetchWeather>(_fetchWeather);
    on<ResetWeather>(_resetWeather);
    on<FetchLocation>(_fetchLocation);
  }

  void _fetchWeather(FetchWeather event, Emitter<WeatherState> emit) async {
    emit(state.copyWhith(isLoading: true));
    final weather = await weatherRepo.getWeather(event.cityTitle);

    emit(state.copyWhith(
      isLoading: false,
      data: weather,
    ));
  }

  void _resetWeather(ResetWeather event, Emitter<WeatherState> emit) async {
    emit(const WeatherState());
  }

  void _fetchLocation(FetchLocation event, Emitter<WeatherState> emit) async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      position.latitude;
      position.longitude;
      final weather = await weatherRepo.getWeatherByCoord(
          lat: position.latitude, lon: position.longitude);

      emit(state.copyWhith(
        isLoading: false,
        data: weather,
      ));
    } catch (e) {
      emit(state.copyWhith(
        isLoading: false,
        error: '$e',
      ));
      rethrow;
    }
  }
}
