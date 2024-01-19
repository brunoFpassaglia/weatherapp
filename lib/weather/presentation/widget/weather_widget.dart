import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/weather/domain/entity/weather.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherResponse weather;
  const WeatherWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      //mobile
      if (constraints.maxWidth < 600) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/sunny.json'),
            Text(weather.main?.temp.toString() ?? ""),
            Text(weather.name ?? 'Who knows?'),
          ],
        );
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(weather.name ?? 'Who knows?'),
            Lottie.asset('assets/sunny.json'),
            Text(weather.main?.temp.toString() ?? "")
          ],
        );
      }
    }));
  }
}
