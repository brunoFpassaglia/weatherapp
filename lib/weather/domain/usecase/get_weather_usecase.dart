import 'package:weather_app/weather/domain/entity/weather.dart';
import 'package:weather_app/weather/domain/repository/weather_repository.dart';

abstract interface class GetWeatherUseCase {
  Future<WeatherResponse> call(double lat, double long);
}

class GetWeatherUseCaseImp implements GetWeatherUseCase {
  final WeatherRepository _repository;

  GetWeatherUseCaseImp({required WeatherRepository repository})
      : _repository = repository;

  @override
  Future<WeatherResponse> call(double lat, double long) async {
    return await _repository.getWeather(lat, long);
  }
}
