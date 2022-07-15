import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

/// User this function to show snack bar
showAppSnackBar(String tittle, [bool status = false]) {
  return Get.showSnackbar(GetSnackBar(
    // message: tittle,
    messageText: tittle.appText(color: whiteColor, size: 14),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: Icon(
      status ? Icons.check_circle_outline_rounded : Icons.error_outline,
      color: whiteColor,
    ),
    backgroundColor: appColor,
    duration: const Duration(seconds: 3),
  ));
}

/// Use this extension for add space in
extension SpaceWidget on double {
  addHSpace() {
    return SizedBox(height: this);
  }

  addWSpace() {
    return SizedBox(
      width: this,
    );
  }
}

extension ExpandedWidget on Widget {
  Expanded expand({Key? key, int flex = 1}) {
    return Expanded(
      key: key,
      flex: flex,
      child: this,
    );
  }
}

extension TextWidget on String {
  appText(
      {double size = 14, FontWeight weight = FontWeight.w600, Color? color}) {
    return Text(
      this,
      style: TextStyle(
          color: color ?? whiteColor, fontWeight: weight, fontSize: size),
    );
  }

  appCenterText(
      {double size = 14, FontWeight weight = FontWeight.w600, Color? color}) {
    return Text(
      this,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color ?? whiteColor, fontWeight: weight, fontSize: size),
    );
  }
}

printData({required dynamic tittle, dynamic val}) {
  debugPrint(tittle + ":-" + val.toString());
}
