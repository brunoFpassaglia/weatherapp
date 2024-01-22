import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather/data/datasource/weather_datasource.dart';

void main() {
  test('test get weather request', () async {
    var client = http.Client();

    var datasource = WeatherDatasourceImpl(httpClient: client);
    var response = await datasource.getWeather(-25.3959, -51.4626);
    expect(response, isA<String>());
  });
}
