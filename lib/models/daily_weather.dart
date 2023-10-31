class DailyWeatherModel {
  Headline? headline;
  List<DailyForecast>? dailyForecasts;

  DailyWeatherModel({this.headline, this.dailyForecasts});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) => DailyWeatherModel(
        headline: json['Headline'] == null
            ? null
            : Headline.fromJson(json['Headline'] as Map<String, dynamic>),
        dailyForecasts: (json['DailyForecasts'] as List<dynamic>?)
            ?.map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'Headline': headline?.toJson(),
        'DailyForecasts': dailyForecasts?.map((e) => e.toJson()).toList(),
      };
}

class Maximum {
  double? value;
  String? unit;
  int? unitType;

  Maximum({this.value, this.unit, this.unitType});

  factory Maximum.fromJson(Map<String, dynamic> json) => Maximum(
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

class Night {
  int? icon;
  String? iconPhrase;
  bool? hasPrecipitation;

  Night({this.icon, this.iconPhrase, this.hasPrecipitation});

  factory Night.fromJson(Map<String, dynamic> json) => Night(
        icon: json['Icon'] as int?,
        iconPhrase: json['IconPhrase'] as String?,
        hasPrecipitation: json['HasPrecipitation'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'Icon': icon,
        'IconPhrase': iconPhrase,
        'HasPrecipitation': hasPrecipitation,
      };
}

class Minimum {
  double? value;
  String? unit;
  int? unitType;

  Minimum({this.value, this.unit, this.unitType});

  factory Minimum.fromJson(Map<String, dynamic> json) => Minimum(
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

class Temperature {
  Minimum? minimum;
  Maximum? maximum;

  Temperature({this.minimum, this.maximum});

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        minimum: json['Minimum'] == null
            ? null
            : Minimum.fromJson(json['Minimum'] as Map<String, dynamic>),
        maximum: json['Maximum'] == null
            ? null
            : Maximum.fromJson(json['Maximum'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Minimum': minimum?.toJson(),
        'Maximum': maximum?.toJson(),
      };
}

class Day {
  int? icon;
  String? iconPhrase;
  bool? hasPrecipitation;

  Day({this.icon, this.iconPhrase, this.hasPrecipitation});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json['Icon'] as int?,
        iconPhrase: json['IconPhrase'] as String?,
        hasPrecipitation: json['HasPrecipitation'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'Icon': icon,
        'IconPhrase': iconPhrase,
        'HasPrecipitation': hasPrecipitation,
      };
}

class DailyForecast {
  String? date;
  int? epochDate;
  Temperature? temperature;
  Day? day;
  Night? night;
  List<dynamic>? sources;
  String? mobileLink;
  String? link;

  DailyForecast({
    this.date,
    this.epochDate,
    this.temperature,
    this.day,
    this.night,
    this.sources,
    this.mobileLink,
    this.link,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        date: json['Date'] as String?,
        epochDate: json['EpochDate'] as int?,
        temperature: json['Temperature'] == null
            ? null
            : Temperature.fromJson(json['Temperature'] as Map<String, dynamic>),
        day: json['Day'] == null
            ? null
            : Day.fromJson(json['Day'] as Map<String, dynamic>),
        night: json['Night'] == null
            ? null
            : Night.fromJson(json['Night'] as Map<String, dynamic>),
        sources: json['Sources'] as List<dynamic>?,
        mobileLink: json['MobileLink'] as String?,
        link: json['Link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Date': date,
        'EpochDate': epochDate,
        'Temperature': temperature?.toJson(),
        'Day': day?.toJson(),
        'Night': night?.toJson(),
        'Sources': sources,
        'MobileLink': mobileLink,
        'Link': link,
      };
}

class Headline {
  String? effectiveDate;
  int? effectiveEpochDate;
  int? severity;
  String? text;
  String? category;
  dynamic endDate;
  dynamic endEpochDate;
  String? mobileLink;
  String? link;

  Headline({
    this.effectiveDate,
    this.effectiveEpochDate,
    this.severity,
    this.text,
    this.category,
    this.endDate,
    this.endEpochDate,
    this.mobileLink,
    this.link,
  });

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        effectiveDate: json['EffectiveDate'] as String?,
        effectiveEpochDate: json['EffectiveEpochDate'] as int?,
        severity: json['Severity'] as int?,
        text: json['Text'] as String?,
        category: json['Category'] as String?,
        endDate: json['EndDate'] as dynamic,
        endEpochDate: json['EndEpochDate'] as dynamic,
        mobileLink: json['MobileLink'] as String?,
        link: json['Link'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'EffectiveDate': effectiveDate,
        'EffectiveEpochDate': effectiveEpochDate,
        'Severity': severity,
        'Text': text,
        'Category': category,
        'EndDate': endDate,
        'EndEpochDate': endEpochDate,
        'MobileLink': mobileLink,
        'Link': link,
      };
}
