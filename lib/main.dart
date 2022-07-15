import 'package:anques_interview_task/constants/app_string.dart';
import 'package:anques_interview_task/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      home: const SplashScreen(),
    );
  }
}
