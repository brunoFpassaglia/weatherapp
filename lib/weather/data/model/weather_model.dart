import 'dart:convert';

import 'package:weather_app/weather/domain/entity/weather.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

base class WeatherResponseModel extends WeatherResponse {
  @override
  final CoordModel? coord;
  @override
  final List<WeatherModel>? weather;
  @override
  final MainModel? main;
  @override
  final WindModel? wind;
  @override
  final CloudsModel? clouds;
  @override
  final SysModel? sys;
  WeatherResponseModel({
    this.coord,
    this.weather,
    super.base,
    this.main,
    super.visibility,
    this.wind,
    this.clouds,
    super.dt,
    this.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'clouds': clouds?.toMap(),
      'dt': dt,
      'sys': sys?.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherResponseModel.fromMap(Map<String, dynamic> map) {
    return WeatherResponseModel(
      coord: map['coord'] != null ? CoordModel.fromMap(map['coord']) : null,
      weather: map['weather'] != null
          ? List.from(map['weather']?.map((x) => WeatherModel.fromMap(x)))
          : null,
      base: map['base'],
      main: map['main'] != null ? MainModel.fromMap(map['main']) : null,
      visibility: map['visibility'],
      wind: map['wind'] != null ? WindModel.fromMap(map['wind']) : null,
      clouds: map['clouds'] != null ? CloudsModel.fromMap(map['clouds']) : null,
      dt: map['dt'],
      sys: map['sys'] != null ? SysModel.fromMap(map['sys']) : null,
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      cod: map['cod'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherResponseModel.fromJson(String source) =>
      WeatherResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class CoordModel extends Coord {
  CoordModel({
    super.lon,
    super.lat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon'],
      lat: map['lat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordModel.fromJson(String source) =>
      CoordModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class WeatherModel extends Weather {
  WeatherModel({
    super.id,
    super.main,
    super.description,
    super.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class MainModel extends Main {
  MainModel({
    super.temp,
    super.feels_like,
    super.temp_min,
    super.temp_max,
    super.pressure,
    super.humidity,
    super.sea_level,
    super.grnd_level,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': sea_level,
      'grnd_level': grnd_level,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp'],
      feels_like: map['feels_like'],
      temp_min: map['temp_min'],
      temp_max: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
      sea_level: map['sea_level'],
      grnd_level: map['grnd_level'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) =>
      MainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class WindModel extends Wind {
  WindModel({
    super.speed,
    super.deg,
    super.gust,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed'],
      deg: map['deg'],
      gust: map['gust'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class CloudsModel extends Clouds {
  CloudsModel({
    super.all,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory CloudsModel.fromMap(Map<String, dynamic> map) {
    return CloudsModel(
      all: map['all'] != null ? map['all'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudsModel.fromJson(String source) =>
      CloudsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

base class SysModel extends Sys {
  SysModel({
    super.country,
    super.sunrise,
    super.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
