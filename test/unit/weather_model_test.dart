import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/weather/data/model/weather_model.dart';
import 'package:weather_app/weather/domain/entity/weather.dart';

void main() {
  test('test if can create a response model', () {
    var jsonInput =
        '{"coord":{"lon":-51.4626,"lat":-25.3959},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":292.41,"feels_like":292.95,"temp_min":292.41,"temp_max":292.41,"pressure":1014,"humidity":98,"sea_level":1014,"grnd_level":892},"visibility":10000,"wind":{"speed":0.64,"deg":32,"gust":0.9},"clouds":{"all":88},"dt":1705448536,"sys":{"country":"BR","sunrise":1705394950,"sunset":1705443675},"timezone":-10800,"id":3461879,"name":"Guarapuava","cod":200}';

    WeatherResponse weather = WeatherResponseModel.fromJson(jsonInput);
    expect(weather, isA<WeatherResponse>());
    expect(weather, isA<WeatherResponseModel>());
  });

  test('test if can create a response model (no coordinates)', () {
    var jsonInput =
        '{"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04n"}],"base":"stations","main":{"temp":292.41,"feels_like":292.95,"temp_min":292.41,"temp_max":292.41,"pressure":1014,"humidity":98,"sea_level":1014,"grnd_level":892},"visibility":10000,"wind":{"speed":0.64,"deg":32,"gust":0.9},"clouds":{"all":88},"dt":1705448536,"sys":{"country":"BR","sunrise":1705394950,"sunset":1705443675},"timezone":-10800,"id":3461879,"name":"Guarapuava","cod":200}';

    WeatherResponse weather = WeatherResponseModel.fromJson(jsonInput);
    expect(weather, isA<WeatherResponse>());
    expect(weather, isA<WeatherResponseModel>());
  });
  test('test if can create a response model (no weather list)', () {
    var jsonInput =
        '{"coord":{"lon":-51.4626,"lat":-25.3959},"base":"stations","main":{"temp":292.41,"feels_like":292.95,"temp_min":292.41,"temp_max":292.41,"pressure":1014,"humidity":98,"sea_level":1014,"grnd_level":892},"visibility":10000,"wind":{"speed":0.64,"deg":32,"gust":0.9},"clouds":{"all":88},"dt":1705448536,"sys":{"country":"BR","sunrise":1705394950,"sunset":1705443675},"timezone":-10800,"id":3461879,"name":"Guarapuava","cod":200}';

    WeatherResponse weather = WeatherResponseModel.fromJson(jsonInput);
    expect(weather, isA<WeatherResponse>());
    expect(weather, isA<WeatherResponseModel>());
  });
  test('test if can create a response model (empty cloud obj)', () {
    var jsonInput =
        '{ "coord": { "lon": -51.4626, "lat": -25.3959 }, "weather": [ { "id": 804, "main": "Clouds", "description": "overcast clouds", "icon": "04n" } ], "base": "stations", "main": { "temp": 292.41, "feels_like": 292.95, "temp_min": 292.41, "temp_max": 292.41, "pressure": 1014, "humidity": 98, "sea_level": 1014, "grnd_level": 892 }, "visibility": 10000, "wind": { "speed": 0.64, "deg": 32, "gust": 0.9 }, "clouds": { }, "dt": 1705448536, "sys": { "country": "BR", "sunrise": 1705394950, "sunset": 1705443675 }, "timezone": -10800, "id": 3461879, "name": "Guarapuava", "cod": 200 }';

    WeatherResponse weather = WeatherResponseModel.fromJson(jsonInput);
    expect(weather, isA<WeatherResponse>());
    expect(weather, isA<WeatherResponseModel>());
  });
}
