import 'package:weather_app/weather/domain/entity/weather.dart';

sealed class WeatherState {}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class SuccessWeatherState extends WeatherState {
  final WeatherResponse weather;
  final String animation;

  SuccessWeatherState(this.weather, this.animation);
}

class ErrorWeatherState extends WeatherState {
  final String error;

  ErrorWeatherState(this.error);
}
