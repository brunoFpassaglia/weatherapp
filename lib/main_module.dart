import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/weather/presentation/home_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    // r.child('/home', child: (context) => HomePage());
    r.child('/', child: (context) => const HomePage());
  }
}
