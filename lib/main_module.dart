import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:weather_app/weather/data/datasource/weather_datasource.dart';
import 'package:weather_app/weather/data/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/repository/weather_repository.dart';
import 'package:weather_app/weather/domain/usecase/get_weather_usecase.dart';
import 'package:weather_app/weather/presentation/home_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<Client>(Client());
    i.add<WeatherDatasource>(WeatherDatasourceImpl.new);
    i.add<WeatherRepository>(WeatherRepositoryImpl.new);
    i.add<GetWeatherUseCase>(GetWeatherUseCaseImp.new);
  }

  @override
  void routes(RouteManager r) {
    // r.child('/home', child: (context) => HomePage());
    r.child('/', child: (context) => const HomePage());
  }
}
