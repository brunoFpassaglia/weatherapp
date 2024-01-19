abstract base class WeatherResponse {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final num? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final num? dt;
  final Sys? sys;
  final num? timezone;
  final num? id;
  final String? name;
  final num? cod;

  WeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });
}

abstract base class Coord {
  final num? lon;
  final num? lat;
  Coord({
    this.lon,
    this.lat,
  });
}

abstract base class Weather {
  final num? id;
  final String? main;
  final String? description;
  final String? icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}

abstract base class Main {
  final num? temp;
  final num? feels_like;
  final num? temp_min;
  final num? temp_max;
  final num? pressure;
  final num? humidity;
  final num? sea_level;
  final num? grnd_level;
  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.humidity,
    required this.sea_level,
    required this.grnd_level,
  });
}

abstract base class Wind {
  final num? speed;
  final num? deg;
  final num? gust;
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
}

abstract base class Clouds {
  final num? all;
  Clouds({
    required this.all,
  });
}

abstract base class Sys {
  final String? country;
  final num? sunrise;
  final num? sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}
