import 'package:anques_interview_task/ui/home/home_screen.dart';
import 'package:anques_interview_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Get.offAll(HomeScreen());
    });
    return Scaffold(
      body: Center(
        child: "Splash Screen".appText(),
      ),
    );
  }
}
