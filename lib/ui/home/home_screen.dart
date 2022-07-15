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
          Column(
            children: [
              Obx(() => HeaderWidget(
                    onNextPress: () {
                      _homeController.changePage(true);
                    },
                    index: _homeController.currentIndex.value,
                    onPreviousPress: () {
                      _homeController.changePage(false);
                    },
                  )).paddingSymmetric(vertical: 20),
              PlayerCard(
                addScore: () {},
                index: 0,
                playerName: " sadasd asd sfh",
                removeScore: () {},
              ).paddingSymmetric(horizontal: 8),
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
