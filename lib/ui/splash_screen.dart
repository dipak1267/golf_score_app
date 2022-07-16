import 'package:anques_interview_task/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      // Get.offAll(HomeScreen());
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctrl) => HomeScreen()));
    });

    return Scaffold(
      body: Image.asset(
        AppImages.appSplashImage,
        height: Get.size.height,
        fit: BoxFit.fill,
        width: Get.size.width,
      ),
    );
  }
}
