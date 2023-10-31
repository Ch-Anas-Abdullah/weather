// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:weather/api/api_key.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/models/daily_weather.dart';
import 'package:weather/models/hourly_weather.dart';
import 'package:weather/models/location_model.dart';
import 'package:http/http.dart' as http;

class FetchWeatherData {
  LocationData? locationData;
  CurrentWeather? currentWeather;
  List<HourlyWeatherModel>? hourlyWeather = [];
  DailyWeatherModel? dailyWeather;

  String getLocationUrl(lat, lon) {
    String locationUrl;
    locationUrl =
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=$apiKey&q=$lat,$lon';
    return locationUrl;
  }

  Future<LocationData> getLocationData(lat, lon) async {
    var response = await http.get(Uri.parse(getLocationUrl(lat, lon)));
    try {
      if (response.statusCode == 200) {
        var jsonString = await jsonDecode(response.body);
        print(response.statusCode);

        locationData = LocationData.fromJson(jsonString);
      } else {
        throw Exception();
      }
    } catch (e) {
      return Future.error('Error occured: Status $e');
    }
    return locationData!;
  }

  Future<CurrentWeather> getCurrentWeather(locationKey) async {
    String url =
        'http://dataservice.accuweather.com/currentconditions/v1/$locationKey?apikey=$apiKey&details=true';

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    var jsonString = await jsonDecode(response.body);

    currentWeather = CurrentWeather.fromJson(jsonString);

    return currentWeather!;
  }

  Future<List<HourlyWeatherModel>> getHourlyWeather(locationKey) async {
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/$locationKey?apikey=$apiKey&metric=true';

    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    List<dynamic> jsonString = await jsonDecode(response.body);

    for (var data in jsonString) {
      hourlyWeather?.add(HourlyWeatherModel.fromJson(data));
    }

    return hourlyWeather!;
  }

  Future<DailyWeatherModel> getDailyWeather(locationKey) async {
    String url =
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey?apikey=$apiKey&metric=true';
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    var jsonString = await jsonDecode(response.body);
    dailyWeather = DailyWeatherModel.fromJson(jsonString);
    print('Remainig Limit ${response.headers['ratelimit-remaining']}');
    return dailyWeather!;
  }
}
