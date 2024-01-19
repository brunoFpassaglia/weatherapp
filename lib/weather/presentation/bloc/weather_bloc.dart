import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {
    on<GetLocalWeatherEvent>(_onGetWeatherEvent);
  }

  void _onGetWeatherEvent(
      GetLocalWeatherEvent event, Emitter<WeatherState> emit) async {
    emit(LoadingWeatherState());
    try {
      var weather = await _weatherUseCase(0, 0);
      emit(SuccessWeatherState(weather));
    } catch (e) {
      emit(ErrorWeatherState());
    }
  }

  final GetWeatherUseCase _weatherUseCase = Modular.get<GetWeatherUseCase>();
}
