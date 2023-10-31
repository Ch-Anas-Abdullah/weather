import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/api/fetch_data.dart';
import 'package:weather/models/current_weather.dart';
import 'package:weather/models/daily_weather.dart';
import 'package:weather/models/hourly_weather.dart';
import 'package:weather/views/home_screen.dart';

import '../models/location_model.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;
  final locationData = LocationData().obs;
  final currentWeather = CurrentWeather().obs;
  final RxList<HourlyWeatherModel> hourlyWeather = <HourlyWeatherModel>[].obs;
  final dailyWeather = DailyWeatherModel().obs;

  bool checkLoading() => _isLoading.value;
  RxDouble getLongitude() => _longitude;
  RxDouble getLatitude() => _latitude;
  RxInt getIndex() => _currentIndex;

  @override
  Future<void> onInit() async {
    if (_isLoading.isTrue) {
      await getLocation();
      print('${getLatitude().value},${getLongitude().value}');
    } else {
      getIndex();
    }

    super.onInit();
  }

  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error('Locaion service is not enabled');
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error('Locaion permission are denied forever');
    } else if (locationPermission == LocationPermission.denied) {
      //requesting permission
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error('Locaion permission is denied');
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .then((value) async {
      _longitude.value = value.longitude;
      _latitude.value = value.latitude;
      await FetchWeatherData()
          .getLocationData(getLatitude(), getLongitude())
          .then((value) async {
        locationData.value = value;
        await FetchWeatherData()
            .getCurrentWeather(locationData.value.key)
            .then((value) {
          currentWeather.value = value;
        });
        await FetchWeatherData()
            .getHourlyWeather(locationData.value.key)
            .then((value) {
          hourlyWeather.value = value;
        });
        await FetchWeatherData()
            .getDailyWeather(locationData.value.key)
            .then((value) {
          dailyWeather.value = value;
        });
        Future.delayed(
          const Duration(seconds: 2),
          () => _isLoading.value = false,
        );
      });
    });
  }
}
