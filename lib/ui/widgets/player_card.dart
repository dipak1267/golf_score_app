// ignore_for_file: must_be_immutable

import 'package:anques_interview_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class PlayerCard extends StatelessWidget {
  PlayerCard({
    Key? key,
    required this.index,
    required this.playerName,
    required this.addScore,
    required this.removeScore,
  }) : super(key: key);

  String playerName;
  String index;
  Function addScore;
  Function removeScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: appColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: playerName.appText(size: 21, weight: FontWeight.w400),
          ),
          _getScoreCard()
        ],
      ),
    );
  }

  Widget _getScoreCard() {
    return Container(
      height: 50,
      width: 200,
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                addScore();
              },
              icon: const Icon(
                Icons.remove_circle_outline_sharp,
                size: 35,
              )),
          index.toString().appCenterText(color: Colors.black, size: 18),
          IconButton(
            onPressed: () {
              addScore();
            },
            icon: const Icon(
              Icons.add_circle_outline_sharp,
              size: 35,
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 9),
    ).paddingAll(8);
  }
}
