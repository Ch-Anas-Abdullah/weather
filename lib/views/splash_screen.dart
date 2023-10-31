import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();

  //       Future.delayed(
  //       Duration(seconds: 3),
  //       (() => Get.to(() => HomeScreen(),
  //           transition: Transition.rightToLeftWithFade)));

  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: BoxDecoration(
        gradient: AppColor.linearGradient,
      ),
      child: Center(
          child: Lottie.asset('assets/lottie/splash_icon.json',
              height: 150, width: 150)),
    );
  }
}
