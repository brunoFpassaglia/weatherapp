import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _weatherUseCase = Modular.get<GetWeatherUseCase>();

  WeatherBloc() : super(InitialWeatherState()) {
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
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    var position = await Geolocator.getCurrentPosition();
    var latitude = position.latitude;
    var longitude = position.longitude;
    return (latitude, longitude);
  }
}
