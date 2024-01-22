import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';
import 'package:weather_app/weather/domain/service/geolocation_service.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/weather/presentation/bloc/weather_state.dart';

class MockGetWeatherUseCase extends Mock implements GetWeatherUseCase {}

class MockGeolocationService extends Mock implements GeolocationService {}

void main() {
  late GetWeatherUseCase mockusecase;
  late GeolocationService mockservice;
  setUpAll(() {
    mockusecase = MockGetWeatherUseCase();
    mockservice = MockGeolocationService();
  });
  blocTest<WeatherBloc, WeatherState>('test bloc success state',
      build: () {
        when(() => mockusecase.call(any(), any()))
            .thenAnswer((_) async => WeatherResponseModel());
        when(() => mockservice.getDeviceLocation())
            .thenAnswer((_) async => (0.0, 0.0));
        return WeatherBloc(
            weatherUseCase: mockusecase, geolocationService: mockservice);
      },
      act: (bloc) => bloc.add(GetLocalWeatherEvent()),
      expect: () => [
            isA<LoadingWeatherState>(),
            isA<SuccessWeatherState>(),
          ]);

  blocTest<WeatherBloc, WeatherState>(
      'test bloc error state on location exception',
      build: () {
        when(() => mockusecase.call(any(), any()))
            .thenAnswer((_) async => WeatherResponseModel());
        when(() => mockservice.getDeviceLocation())
            .thenThrow(Exception('some exception'));
        return WeatherBloc(
            weatherUseCase: mockusecase, geolocationService: mockservice);
      },
      act: (bloc) => bloc.add(GetLocalWeatherEvent()),
      expect: () => [
            isA<LoadingWeatherState>(),
            isA<ErrorWeatherState>(),
          ]);

  blocTest<WeatherBloc, WeatherState>(
      'test bloc error state on usecase exception',
      build: () {
        when(() => mockusecase.call(any(), any()))
            .thenThrow(Exception('some excemption'));
        when(() => mockservice.getDeviceLocation())
            .thenAnswer((_) async => (0.0, 0.0));
        return WeatherBloc(
            weatherUseCase: mockusecase, geolocationService: mockservice);
      },
      act: (bloc) => bloc.add(GetLocalWeatherEvent()),
      expect: () => [
            isA<LoadingWeatherState>(),
            isA<ErrorWeatherState>(),
          ]);
}
