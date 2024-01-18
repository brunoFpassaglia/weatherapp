import 'package:weather_app/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';
import 'package:weather_app/weather/domain/entity/weather.dart';
import 'package:weather_app/weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDatasource _datasource;

  WeatherRepositoryImpl({required WeatherDatasource datasource})
      : _datasource = datasource;

  @override
  Future<WeatherResponse> getWeather(double lat, double long) async {
    var body = await _datasource.getWeather(lat, long);
    var weather = WeatherResponseModel.fromJson(body);
    return weather;
  }
}
