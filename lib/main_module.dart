import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:weather_app/auth/data/datasource/auth_datasource.dart';
import 'package:weather_app/auth/data/repository/auth_repository.dart';
import 'package:weather_app/auth/domain/repository/auth_repository.dart';
import 'package:weather_app/auth/domain/usecase/login_use_case.dart';
import 'package:weather_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/auth/presentation/login_page.dart';
import 'package:weather_app/guards.dart';
import 'package:weather_app/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/data/service/geolocation_service.dart';
import 'package:weather_app/weather/domain/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/service/geolocation_service.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/home_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<Client>(Client());
    i.add<WeatherDatasource>(WeatherDatasourceImpl.new);
    i.add<WeatherRepository>(WeatherRepositoryImpl.new);
    i.add<GetWeatherUseCase>(GetWeatherUseCaseImp.new);
    i.add<GeolocationService>(GeolocationServiceImpl.new);
    i.addLazySingleton<WeatherBloc>(WeatherBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
    i.add<AuthDataSource>(AuthDataSourceImpl.new);
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.add<LoginUseCase>(LoginUseCaseImpl.new);
    i.addLazySingleton<AuthBloc>(AuthBloc.new,
        config: BindConfig(
          onDispose: (bloc) => bloc.close(),
        ));
  }

  @override
  void routes(RouteManager r) {
    r.child('/home',
        child: (context) => const HomePage(), guards: [AuthGuard()]);
    r.child('/login', child: (context) => const LoginPage());
  }
}
