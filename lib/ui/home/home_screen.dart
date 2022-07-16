import 'package:anques_interview_task/constants/constants.dart';
import 'package:anques_interview_task/ui/home/home_controller.dart';
import 'package:anques_interview_task/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_string.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTittleText.appText(size: 22),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              AppImages.appBgImage,
              height: Get.size.height,
              width: Get.size.width,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Obx(() => HeaderWidget(
                    onNextPress: () {
                      _homeController.changePage(true);
                    },
                    index: _homeController.holeNumber.value,
                    onPreviousPress: () {
                      _homeController.changePage(false);
                    },
                  )).paddingSymmetric(vertical: 20),
              GetBuilder<HomeController>(
                  id: _homeController.golfPlayerListId,
                  builder: (ctrl) => ctrl.selectedGame != null
                      ? Column(
                          children: ctrl.selectedGame!.players
                              .map(
                                (playerData) => PlayerCard(
                                  addScore: () {
                                    playerData.defaultScore++;
                                    ctrl.update([ctrl.golfPlayerListId]);
                                  },
                                  index: playerData.defaultScore.toString(),
                                  playerName:
                                      "${playerData.firstName} ${playerData.lastName}",
                                  removeScore: () {
                                    if (playerData.defaultScore != 0) {
                                      playerData.defaultScore--;
                                    }
                                    ctrl.update([ctrl.golfPlayerListId]);
                                  },
                                ).paddingSymmetric(horizontal: 8, vertical: 5),
                              )
                              .toList(),
                        )
                      : const SizedBox())
            ],
          ).paddingSymmetric(horizontal: 12),
          Obx(() => Visibility(
              visible: _homeController.isLoading.value,
              child: const AppProgressView())),
        ],
      ),
    );
  }
}
