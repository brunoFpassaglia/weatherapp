import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/domain/service/geolocation_service.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _weatherUseCase;
  final GeolocationService _geolocationService;

  WeatherBloc({
    required GeolocationService geolocationService,
    required GetWeatherUseCase weatherUseCase,
  })  : _weatherUseCase = weatherUseCase,
        _geolocationService = geolocationService,
        super(InitialWeatherState()) {
    on<GetLocalWeatherEvent>(_onGetWeatherEvent);
  }

  void _onGetWeatherEvent(
      GetLocalWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(LoadingWeatherState());
    try {
      var (lat, long) = await _getPosition();
      var weather = await _weatherUseCase(lat, long);
      var animation = switch (weather.weather?.first.main) {
        "Clouds" => "assets/cloud.json",
        "Rain" => "assets/rain.json",
        "Clear" => "assets/sunny.json",
        _ => "assets/sunny.json"
      };
      emit(SuccessWeatherState(weather, animation));
    } catch (e) {
      emit(ErrorWeatherState(e.toString()));
    }
  }

  Future<(double, double)> _getPosition() async {
    return await _geolocationService.getDeviceLocation();
  }
}
