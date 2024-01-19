import 'dart:developer';

import 'package:http/http.dart';

abstract interface class WeatherDatasource {
  Future<String> getWeather(double lat, double long);
}

class WeatherDatasourceImpl implements WeatherDatasource {
  final Client httpClient;

  WeatherDatasourceImpl({required this.httpClient});

  @override
  Future<String> getWeather(double lat, double long) async {
    var uri = Uri.https('api.openweathermap.org', 'data/2.5/weather', {
      'lat': lat.toString(),
      'lon': long.toString(),
      'appid': 'fcc7658a4dfb9229ef701d7ad9e52c34'
    });
    var response = await httpClient.get(uri);
    log(response.body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Error getting the weather info');
    }
  }
}
