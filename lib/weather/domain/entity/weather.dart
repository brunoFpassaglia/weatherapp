abstract base class WeatherResponse {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

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
  final double? lon;
  final double? lat;
  Coord({
    this.lon,
    this.lat,
  });
}

abstract base class Weather {
  final int? id;
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
  final double? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final int? pressure;
  final int? humidity;
  final int? sea_level;
  final int? grnd_level;
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
  final double? speed;
  final int? deg;
  final double? gust;
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
}

abstract base class Clouds {
  final int? all;
  Clouds({
    required this.all,
  });
}

abstract base class Sys {
  final String? country;
  final int? sunrise;
  final int? sunset;

  Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}
