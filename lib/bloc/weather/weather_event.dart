part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchWeather extends WeatherEvent {
  final String cityTitle;

  FetchWeather(this.cityTitle);
  @override
  List<Object?> get props => [cityTitle];
}

class ResetWeather extends WeatherEvent {}

class FetchLocation extends WeatherEvent {}
