import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/response_model.dart';
import '../utils/extensions.dart';
import 'api_exception.dart';

class BaseApiHelper {
  static Future<ResponseItem> postRequest(
      String requestUrl, Map<String, dynamic> requestData) async {
    printData(tittle: "request", val: requestUrl);

    // printData(tittle: "headers:", val: requestHeader(passAuthToken).toString());
    printData(tittle: "body:", val: json.encode(requestData));

    return await http
        .post(
          Uri.parse(requestUrl),
          body: json.encode(requestData),
        )
        .then((response) => baseOnValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> getRequest(String requestUrl) async {
    printData(tittle: "request", val: requestUrl);
    return await http
        .get(Uri.parse(requestUrl))
        .then((response) => baseOnValue(response))
        .onError((error, stackTrace) => onError(error));
  }

  static Future baseOnValue(http.Response response) async {
    ResponseItem result;

    final Map<String, dynamic> responseData = json.decode(response.body);
    bool status = false;
    String message;
    dynamic data = responseData;

    printData(tittle: "responseCode:", val: response.statusCode.toString());
    if (response.statusCode == 200) {
      message = "Ok";
      status = true;
      data = responseData;
    } else {
      printData(tittle: "Error in", val: data);
      message = "Something went wrong.";
    }
    result = ResponseItem(data: data, message: message, status: status);
    log(
      "response: {data: ${result.data}, message: $message, status: $status}",
      //name: appName
    );
    printData(
        tittle: "response",
        val: "{data: ${result.data}, message: $message, status: $status}");
    return result;
  }

  static onError(error) {
    debugPrint(error.toString());
    bool status = false;
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
