class HourlyWeatherModel {
  String? dateTime;
  int? epochDateTime;
  int? weatherIcon;
  String? iconPhrase;
  bool? hasPrecipitation;
  bool? isDaylight;
  Temperature? temperature;
  int? precipitationProbability;
  String? mobileLink;
  String? link;

  HourlyWeatherModel({
    this.dateTime,
    this.epochDateTime,
    this.weatherIcon,
    this.iconPhrase,
    this.hasPrecipitation,
    this.isDaylight,
    this.temperature,
    this.precipitationProbability,
    this.mobileLink,
    this.link,
  });

  factory HourlyWeatherModel.fromJson(Map<String, dynamic> json) => HourlyWeatherModel(
        dateTime: json['DateTime'] as String?,
        epochDateTime: json['EpochDateTime'] as int?,
        weatherIcon: json['WeatherIcon'] as int?,
        iconPhrase: json['IconPhrase'] as String?,
        hasPrecipitation: json['HasPrecipitation'] as bool?,
        isDaylight: json['IsDaylight'] as bool?,
        temperature: json['Temperature'] == null
            ? null
            : Temperature.fromJson(json['Temperature'] as Map<String, dynamic>),
        precipitationProbability: json['PrecipitationProbability'] as int?,
        mobileLink: json['MobileLink'] as String?,
        link: json['Link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'DateTime': dateTime,
        'EpochDateTime': epochDateTime,
        'WeatherIcon': weatherIcon,
        'IconPhrase': iconPhrase,
        'HasPrecipitation': hasPrecipitation,
        'IsDaylight': isDaylight,
        'Temperature': temperature?.toJson(),
        'PrecipitationProbability': precipitationProbability,
        'MobileLink': mobileLink,
        'Link': link,
      };
}

class Temperature {
  double? value;
  String? unit;
  int? unitType;

  Temperature({this.value, this.unit, this.unitType});

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
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
