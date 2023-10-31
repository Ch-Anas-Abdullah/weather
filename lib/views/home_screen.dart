import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:weather/controller/global_controller.dart';
import 'package:weather/models/location_model.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/views/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColor.linearGradient),
        child: Obx(() {
          return globalController.checkLoading()
              ? const SplashScreen()
              : ListView(
                  children: [
                    HeaderWidget(),
                    HourlyDataWidget(),
                    DailyDataWidget(),
                    // UVIndexWidget()
                    
                  ],
                );
        }),
      ),
    );
  }
}

class HeaderWidget extends StatefulWidget {
   const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  LocationData locationData = LocationData();
  @override
  void initState() {
    getAddress(globalController.getLongitude().value,
        globalController.getLatitude().value);

    super.initState();
  }

  getAddress(lon, lat) async {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColor.textClr,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${globalController.locationData.value.localizedName} ${globalController.locationData.value.parentCity ==null ?'' :globalController.locationData.value.parentCity!.localizedName}',
                style: TextStyle(
                    color: AppColor.textClr,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Icon(
                Icons.notifications_none_rounded,
                color: AppColor.textClr,
                size: 30,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Lottie.asset(
              'assets/lottie/${globalController.currentWeather.value.weatherIcon}.json',
              height: 170,
              repeat: true),
          const SizedBox(height: 5),
          Text(
            '${globalController.currentWeather.value.weatherText}',
            style: TextStyle(
              letterSpacing: 1,
              color: AppColor.textClr,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${globalController.currentWeather.value.temperature!.metric!.value!.toInt()}º',
            style: TextStyle(
                color: AppColor.textClr,
                fontSize: 60,
                letterSpacing: 1,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Container(
            width: size.width,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.containerBackground),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/humidity.png',
                  width: 22,
                  height: 22,
                  color: AppColor.textClr,
                ),
                const SizedBox(width: 5),
                Text(
                  '${globalController.currentWeather.value.relativeHumidity}%',
                  style: TextStyle(
                      color: AppColor.textClr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/wind.png',
                  width: 22,
                  height: 22,
                  color: AppColor.textClr,
                ),
                const SizedBox(width: 5),
                Text(
                  '${globalController.currentWeather.value.wind!.speed!.metric!.value!.toInt()} ${globalController.currentWeather.value.wind!.speed!.metric!.unit}',
                  style: TextStyle(
                      color: AppColor.textClr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Image.asset(
                  'assets/icons/thermo.png',
                  width: 22,
                  height: 22,
                  color: AppColor.textClr,
                ),
                const SizedBox(width: 5),
                Text(
                  '${globalController.currentWeather.value.cloudCover}%',
                  style: TextStyle(
                      color: AppColor.textClr,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HourlyDataWidget extends StatefulWidget {
  const HourlyDataWidget({super.key});

  @override
  State<HourlyDataWidget> createState() => _HourlyDataWidgetState();
}

class _HourlyDataWidgetState extends State<HourlyDataWidget> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    RxInt cardIndex = globalController.getIndex();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 240,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColor.containerBackground,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyle(
                    color: AppColor.textClr,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                DateFormat('MMM, dd')
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        globalController.hourlyWeather[0].epochDateTime! *
                            1000))
                    .toString(),
                style: TextStyle(color: AppColor.textClr, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: globalController.hourlyWeather.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    cardIndex.value = index;
                  },
                  child: Obx(() {
                    return Container(
                      width: 100,
                      height: 150,
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: cardIndex.value.isEqual(index)
                          ? BoxDecoration(
                              color: AppColor.textClr.withAlpha(20),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: AppColor.textClr.withAlpha(100)))
                          : null,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${globalController.hourlyWeather[index].temperature!.value!.toInt()}ºC',
                            style: TextStyle(
                                color: AppColor.textClr, fontSize: 18),
                          ),
                          Lottie.asset(
                              'assets/lottie/${globalController.hourlyWeather[index].weatherIcon}.json',
                              width: 70,
                              height: 70),
                          Text(
                            DateFormat('hh:mm').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    globalController.hourlyWeather[index]
                                            .epochDateTime! *
                                        1000)),
                            style: TextStyle(
                                color: AppColor.textClr, fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DailyDataWidget extends StatelessWidget {
  DailyDataWidget({super.key});
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColor.containerBackground,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'This week',
              style: TextStyle(
                  color: AppColor.textClr,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          ListView.builder(
            itemCount:
                globalController.dailyWeather.value.dailyForecasts!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    Text(
                      DateFormat('E').format(
                          DateTime.fromMillisecondsSinceEpoch(globalController
                                  .dailyWeather
                                  .value
                                  .dailyForecasts![index]
                                  .epochDate! *
                              1000)),
                      style: TextStyle(
                          color: AppColor.textClr,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Lottie.asset(
                      'assets/lottie/${globalController.dailyWeather.value.dailyForecasts![index].day!.icon}.json',
                      height: 25,
                    ),
                    const Spacer(),
                    Text(
                      '${globalController.dailyWeather.value.dailyForecasts![index].temperature!.maximum!.value!.toInt()}ºC',
                      style: TextStyle(
                        color: AppColor.textClr,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${globalController.dailyWeather.value.dailyForecasts![index].temperature!.minimum!.value!.toInt()}ºC',
                      style: TextStyle(
                        color: AppColor.textClr.withAlpha(180),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

