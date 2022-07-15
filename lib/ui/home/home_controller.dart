import 'package:anques_interview_task/api/repositories/home_repo.dart';
import 'package:get/get.dart';

import '../../constants/app_string.dart';
import '../../models/golf_list.dart';
import '../../models/response_model.dart';
import '../../utils/extensions.dart';

class HomeController extends GetxController {
  String golfListId = "golfListId";
  RxBool isLoading = false.obs;
  RxList<GolfGame> gameList = <GolfGame>[].obs;
  RxInt currentIndex = 0.obs;
  GolfGame? selectedGame;

  @override
  void onInit() {
    getGolfData();
    super.onInit();
  }

  changePage(bool isNext) {
    if (isNext) {
      currentIndex++;
    } else {
      currentIndex--;
    }
  }

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
        }
        currentIndex.value = 1;
      } else {
        showAppSnackBar(result.message);
      }
    } catch (e) {
      showAppSnackBar(e.toString());
    }

    update([golfListId]);
  }
}
