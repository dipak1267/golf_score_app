import '../../constants/app_string.dart';
import '../../constants/request_constant.dart';
import '../../models/response_model.dart';
import '../api_helpers.dart';

class HomeRepo {
  /// this function get golf match
  static Future<ResponseItem> getGoldMatch() async {
    try {
      var params = {
        "data": [
          {"match_id": "59"}
        ]
      };

      var queryParameters = {RequestParam.method: MethodNames.golfMatch};
      String queryString = Uri(queryParameters: queryParameters).query;
      String requestUrl = AppUrls.BASE_URL + queryString;
      ResponseItem result = await BaseApiHelper.postRequest(requestUrl, params);
      bool status = false;
      String message = errorText;
      if (result.data["success"] != null) {
        status = true;
        message = "Success";
      }

      return ResponseItem(status: status, data: result.data, message: message);
    } catch (exception) {
      return ResponseItem(data: null, message: errorText, status: false);
    }
  }
}
