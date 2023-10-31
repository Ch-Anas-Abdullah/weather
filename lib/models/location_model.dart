class LocationData {
  String? key;
  int? rank;
  String? localizedName;
  Country? country;
  ParentCity? parentCity;

  LocationData({
    this.key,
    this.localizedName,
    this.country,
    this.parentCity,
  });
  factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
        key: json['Key'] as String?,
        localizedName: json['LocalizedName'] as String?,
        country: json['Country'] == null
            ? null
            : Country.fromJson(json['Country'] as Map<String, dynamic>),
        parentCity: json['ParentCity'] == null
            ? null
            : ParentCity.fromJson(json['ParentCity'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'Key': key,
        'Rank': rank,
        'LocalizedName': localizedName,
        'Country': country?.toJson(),
      };
}

class Country {
  String? id;
  String? localizedName;

  Country({
    this.id,
    this.localizedName,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['ID'] as String?,
        localizedName: json['LocalizedName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ID': id,
        'LocalizedName': localizedName,
      };
}

class ParentCity {
  String? key;
  String localizedName;
  String? englishName;

  ParentCity({this.key, this.localizedName ='', this.englishName});

  factory ParentCity.fromJson(Map<String, dynamic> json) => ParentCity(
        key: json['Key'] as String?,
        localizedName: json['LocalizedName'] as String,
        englishName: json['EnglishName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Key': key,
        'LocalizedName': localizedName,
        'EnglishName': englishName,
      };
}
