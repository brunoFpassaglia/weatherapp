import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/weather/domain/entity/weather.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherResponse weather;
  final String animation;
  const WeatherWidget({
    super.key,
    required this.weather,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      //mobile
      if (constraints.maxWidth < 600) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(animation),
            Text(
              "${weather.main?.temp.toString() ?? ""}°K",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place),
                Text(
                  weather.name ?? 'Who knows?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
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
