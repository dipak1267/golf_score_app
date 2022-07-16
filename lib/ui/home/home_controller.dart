import 'package:anques_interview_task/api/repositories/home_repo.dart';
import 'package:get/get.dart';

import '../../constants/app_string.dart';
import '../../models/golf_list.dart';
import '../../models/response_model.dart';
import '../../utils/extensions.dart';

class HomeController extends GetxController {
  String golfPlayerListId = "golfListId";
  RxBool isLoading = false.obs;
  RxList<GolfGame> gameList = <GolfGame>[].obs;
  RxInt currentIndex = 0.obs;
  RxString holeNumber = "0".obs;
  GolfGame? selectedGame;

  @override
  void onInit() {
    getGolfData();
    super.onInit();
  }

  /// Use this function to change match
  changePage(bool isNext) {
    if (isNext) {
      if (currentIndex.value == (gameList.length - 1)) {
        currentIndex.value = 0;
      } else {
        currentIndex++;
      }
    } else {
      if (currentIndex.value == 1) {
        currentIndex.value = gameList.length - 1;
      } else {
        currentIndex--;
      }
    }
    selectedGame = gameList[currentIndex.value];
    holeNumber.value = gameList[currentIndex.value].holeNumber;
    update([golfPlayerListId]);
  }

  /// Use this function to get golf gam list
  getGolfData() async {
    ResponseItem result =
        ResponseItem(data: null, message: errorText, status: false);
    result = await HomeRepo.getGoldMatch();

    try {
      if (result.status) {
        var data = GolfGameList.fromJson(result.data);
        gameList.value = data.data;
        if (data.data.isNotEmpty) {
          selectedGame = data.data.first;
          holeNumber.value = data.data.first.holeNumber;
        }
        currentIndex.value = 1;
      } else {
        showAppSnackBar(result.message);
      }
    } catch (e) {
      showAppSnackBar(e.toString());
    }

    update([golfPlayerListId]);
  }
}
