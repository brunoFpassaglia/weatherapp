import 'package:weather_app/weather/domain/entity/weather.dart';

abstract interface class WeatherRepository {
  Future<WeatherResponse> getWeather(double lat, double long);
}
