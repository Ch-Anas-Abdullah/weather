// class CurrentWeather {
//   String? localObservationDateTime;
//   int? epochTime;
//   String? weatherText;
//   int? weatherIcon;
//   bool? isDayTime;
//   Temperature? temperature;
//   String? mobileLink;
//   String? link;
//   int? relativeHumidity;
//   Wind? wind;
//   RealFeelTemperature? realFeelTemperature;
//   int? uvIndex;
//   int? cloudCover;
//   CurrentWeather(
//       {this.localObservationDateTime,
//       this.epochTime,
//       this.weatherText,
//       this.weatherIcon,
//       this.isDayTime,
//       this.temperature,
//       this.mobileLink,
//       this.link,
//       this.wind,
//       this.uvIndex,
//       this.realFeelTemperature,
//       this.cloudCover,
//       this.relativeHumidity});

//   factory CurrentWeather.fromJson(Map<String,dynamic> json) {
//     return CurrentWeather(
//       localObservationDateTime: json['LocalObservationDateTime'] as String?,
//       epochTime: json['EpochTime'] as int?,
//       weatherText: json['WeatherText'] as String?,
//       weatherIcon: json['WeatherIcon'] as int?,
//       isDayTime: json['IsDayTime'] as bool?,
//       temperature: json['Temperature'] == null
//           ? null
//           : Temperature.fromJson(
//               json['Temperature'] as Map<String, dynamic>),
//       mobileLink: json['MobileLink'] as String?,
//       link: json['Link'] as String?,
//       wind: json['Wind'] == null
//           ? null
//           : Wind.fromJson(json['Wind'] as Map<String, dynamic>),
//       uvIndex: json['UVIndex'] as int?,
//       realFeelTemperature: json['RealFeelTemperature'] == null
//           ? null
//           : RealFeelTemperature.fromJson(
//               json['RealFeelTemperature'] as Map<String, dynamic>),
//       relativeHumidity: json['RelativeHumidity'] as int?,
//       cloudCover: json['CloudCover'] as int?,

    
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'LocalObservationDateTime': localObservationDateTime,
//         'EpochTime': epochTime,
//         'WeatherText': weatherText,
//         'WeatherIcon': weatherIcon,
//         'IsDayTime': isDayTime,
//         'Temperature': temperature?.toJson(),
//         'MobileLink': mobileLink,
//         'Link': link,
//       };
// }

class CurrentWeather {
  String? localObservationDateTime;
  int? epochTime;
  String? weatherText;
  int? weatherIcon;
  bool? isDayTime;
  Temperature? temperature;
  String? mobileLink;
  String? link;
  int? relativeHumidity;
  Wind? wind;
  RealFeelTemperature? realFeelTemperature;
  int? uvIndex;
  int? cloudCover;
  CurrentWeather(
      {this.localObservationDateTime,
      this.epochTime,
      this.weatherText,
      this.weatherIcon,
      this.isDayTime,
      this.temperature,
      this.mobileLink,
      this.link,
      this.wind,
      this.uvIndex,
      this.realFeelTemperature,
      this.cloudCover,
      this.relativeHumidity});

  factory CurrentWeather.fromJson(List<dynamic> json) {
    return CurrentWeather(
      localObservationDateTime: json[0]['LocalObservationDateTime'] as String?,
      epochTime: json[0]['EpochTime'] as int?,
      weatherText: json[0]['WeatherText'] as String?,
      weatherIcon: json[0]['WeatherIcon'] as int?,
      isDayTime: json[0]['IsDayTime'] as bool?,
      temperature: json[0]['Temperature'] == null
          ? null
          : Temperature.fromJson(
              json[0]['Temperature'] as Map<String, dynamic>),
      mobileLink: json[0]['MobileLink'] as String?,
      link: json[0]['Link'] as String?,
      wind: json[0]['Wind'] == null
          ? null
          : Wind.fromJson(json[0]['Wind'] as Map<String, dynamic>),
      uvIndex: json[0]['UVIndex'] as int?,
      realFeelTemperature: json[0]['RealFeelTemperature'] == null
          ? null
          : RealFeelTemperature.fromJson(
              json[0]['RealFeelTemperature'] as Map<String, dynamic>),
      relativeHumidity: json[0]['RelativeHumidity'] as int?,
      cloudCover: json[0]['CloudCover'] as int?,

    
    );
  }

  Map<String, dynamic> toJson() => {
        'LocalObservationDateTime': localObservationDateTime,
        'EpochTime': epochTime,
        'WeatherText': weatherText,
        'WeatherIcon': weatherIcon,
        'IsDayTime': isDayTime,
        'Temperature': temperature?.toJson(),
        'MobileLink': mobileLink,
        'Link': link,
      };
}

class Temperature {
  Metric? metric;
  Imperial? imperial;

  Temperature({this.metric, this.imperial});

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        metric: json['Metric'] == null
            ? null
            : Metric.fromJson(json['Metric'] as Map<String, dynamic>),
        imperial: json['Imperial'] == null
            ? null
            : Imperial.fromJson(json['Imperial'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Metric': metric?.toJson(),
        'Imperial': imperial?.toJson(),
      };
}

class Imperial {
  double? value;
  String? unit;
  int? unitType;

  Imperial({this.value, this.unit, this.unitType});

  factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json['Value'] as double?,
        unit: json['Unit'] as String?,
        unitType: json['UnitType'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Value': value,
        'Unit': unit,
        'UnitType': unitType,
      };
}

class Metric {
  double? value;
  String? unit;
  int? unitType;

  Metric({this.value, this.unit, this.unitType});

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        value: json['Value'] as double?,
        unit: json['Unit'] as String?,
        unitType: json['UnitType'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'Value': value,
        'Unit': unit,
        'UnitType': unitType,
      };
}

class Wind {
  Direction? direction;
  Speed? speed;

  Wind({this.direction, this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        direction: json['Direction'] == null
            ? null
            : Direction.fromJson(json['Direction'] as Map<String, dynamic>),
        speed: json['Speed'] == null
            ? null
            : Speed.fromJson(json['Speed'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Direction': direction?.toJson(),
        'Speed': speed?.toJson(),
      };
}

class Direction {
  int? degrees;
  String? localized;
  String? english;

  Direction({this.degrees, this.localized, this.english});

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        degrees: json['Degrees'] as int?,
        localized: json['Localized'] as String?,
        english: json['English'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Degrees': degrees,
        'Localized': localized,
        'English': english,
      };
}

class Speed {
  Metric? metric;
  Imperial? imperial;

  Speed({this.metric, this.imperial});

  factory Speed.fromJson(Map<String, dynamic> json) => Speed(
        metric: json['Metric'] == null
            ? null
            : Metric.fromJson(json['Metric'] as Map<String, dynamic>),
        imperial: json['Imperial'] == null
            ? null
            : Imperial.fromJson(json['Imperial'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Metric': metric?.toJson(),
        'Imperial': imperial?.toJson(),
      };
}

class RealFeelTemperature {
  Metric? metric;
  Imperial? imperial;

  RealFeelTemperature({this.metric, this.imperial});

  factory RealFeelTemperature.fromJson(Map<String, dynamic> json) {
    return RealFeelTemperature(
      metric: json['Metric'] == null
          ? null
          : Metric.fromJson(json['Metric'] as Map<String, dynamic>),
      imperial: json['Imperial'] == null
          ? null
          : Imperial.fromJson(json['Imperial'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'Metric': metric?.toJson(),
        'Imperial': imperial?.toJson(),
      };
}
