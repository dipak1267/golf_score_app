// ignore_for_file: must_be_immutable

import 'package:anques_interview_task/constants/app_string.dart';
import 'package:anques_interview_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget(
      {Key? key,
      required this.index,
      required this.onNextPress,
      required this.onPreviousPress})
      : super(key: key);
  String index;
  Function onNextPress;
  Function onPreviousPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: appColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                onPreviousPress();
              },
              icon: const Icon(Icons.fast_rewind_sharp,
                  color: whiteColor, size: 29)),
          const Spacer(),
          homeTittleText.appText(size: 21, weight: FontWeight.w500),
          (5.0).addWSpace(),
          Container(
            height: 32,
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: index.toString().appText(size: 16, color: Colors.black),
            ).paddingSymmetric(horizontal: 3),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                onNextPress();
              },
              icon: const Icon(Icons.fast_forward_sharp,
                  size: 29, color: whiteColor)),
        ],
      ),
    );
  }
}
