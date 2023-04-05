class WeatherModel {
  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  static WeatherModel fromJson(Map<String, dynamic> json) {
    var length = json.length;
    return WeatherModel(
        coord: Coord.fromJson(json['coord']),
        weather: List.from(json['weather'] ?? [])
            .map((e) => Weather.fromJson(e))
            .toList(),
        base: json['base'] ?? "",
        main: Main.fromJson(json['main'] ?? []),
        visibility: json['visibility'],
        wind: Wind.fromJson(json['wind'] ?? {}),
        rain: Rain.fromJson(json['rain'] ?? {}),
        clouds: Clouds.fromJson(json['clouds'] ?? {}),
        dt: json['dt'] ?? 0,
        sys: Sys.fromJson(json['sys'] ?? {}),
        timezone: json['timezone'] ?? 0,
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        cod: json['cod'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coord'] = coord.toJson();
    data['weather'] = weather.map((e) => e.toJson()).toList();
    data['base'] = base;
    data['main'] = main.toJson();
    data['visibility'] = visibility;
    data['wind'] = wind.toJson();
    data['rain'] = rain.toJson();
    data['clouds'] = clouds.toJson();
    data['dt'] = dt.toDouble();
    data['sys'] = sys.toJson();
    data['timezone'] = timezone.toDouble();
    data['id'] = id.toDouble();
    data['name'] = name;
    data['cod'] = cod.toDouble();
    return data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });

  final num lon;
  final num lat;

  static Coord fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'] ?? 0.0,
      lat: json['lat'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  final num id;
  final String main;
  final String description;
  final String icon;

  static Weather fromJson(Map<String, dynamic> json) {
    return Weather(
        id: json['id'] ?? 0,
        main: json['main'] ?? "",
        description: json['description'] ?? "",
        icon: json['icon'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id.toDouble();
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;
  final num seaLevel;
  final num grndLevel;

  static Main fromJson(Map<String, dynamic> json) {
    return Main(
        temp: json['temp'] ?? 0.0,
        feelsLike: json['feels_like'] ?? 0.0,
        tempMin: json['temp_min'] ?? 0.0,
        tempMax: json['temp_max'] ?? 0.0,
        pressure: json['pressure'] ?? 0,
        humidity: json['humidity'] ?? 0,
        seaLevel: json['sea_level'] ?? 0,
        grndLevel: json['grnd_level'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['temp'] = temp.toDouble();
    data['feels_like'] = feelsLike.toDouble();
    data['temp_min'] = tempMin.toDouble();
    data['temp_max'] = tempMax.toDouble();
    data['pressure'] = pressure.toDouble();
    data['humidity'] = humidity.toDouble();
    data['sea_level'] = seaLevel.toDouble();
    data['grnd_level'] = grndLevel.toDouble();
    return data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final num speed;
  final num deg;
  final num gust;

  static Wind fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] ?? 0,
      deg: json['deg'] ?? 0,
      gust: json['gust'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Rain {
  Rain({
    required this.hour,
  });

  final num hour;

  static Rain fromJson(Map<String, dynamic>? json) {
    return Rain(hour: json?['1h'] ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['1h'] = hour.toDouble();
    return data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });

  final num all;

  static Clouds fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Sys {
  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final num type;
  final num id;
  final String country;
  final num sunrise;
  final num sunset;

  static Sys fromJson(Map<String, dynamic> json) {
    return Sys(
      type: json['type'] ?? 0,
      id: json['id'] ?? 0,
      country: json['country'] ?? "",
      sunrise: json['sunrise'] ?? 0,
      sunset: json['sunset'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type.toDouble();
    data['id'] = id.toDouble();
    data['country'] = country;
    data['sunrise'] = sunrise.toDouble();
    data['sunset'] = sunset.toDouble();
    return data;
  }
}
