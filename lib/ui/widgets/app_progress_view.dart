import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppProgressView extends StatelessWidget {
  const AppProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: Get.height,
        color: Colors.white.withOpacity(0.5),
        child: const Center(
            child: CupertinoActivityIndicator(
          radius: 20,
          animating: true,
        )));
  }
}
