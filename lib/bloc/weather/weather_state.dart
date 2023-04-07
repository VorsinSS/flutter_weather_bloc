part of 'weather_bloc.dart';

@immutable
class WeatherState extends Equatable {
  final bool isLoading;
  final String? error;
  final WeatherModel? data;
  const WeatherState({
    this.isLoading = false,
    this.error,
    this.data,
  });

  WeatherState copyWhith({bool? isLoading, String? error, WeatherModel? data}) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [isLoading, error, data];
}
