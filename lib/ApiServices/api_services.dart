import 'dart:convert';
import 'dart:io';
import 'package:MovieDiscoveryApp/ResponseModels/MovieDetailResponseModel.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../ResponseModels/MoviesDataResponseModel.dart';
import '../utils/PrefKeys.dart';
import '../utils/common.dart';
import '../utils/common_shared_preferences.dart';
import 'api_responses.dart';
import 'api_urls.dart';
import 'api_utils.dart';

class ApiServices {
  AppUtils appUtils = AppUtils();
  Common commonItems = Common();

  Dio? _dio;

  var errorRes = {
    "status": false,
    "message": "Oops! Something went wrong, please try again",
  };

  var errorResError = {
    "status": false,
    "message": "Internal server problem!",
  };

  var internetCon = {
    "status": false,
    "message": "Please check your internet connection.",
  };

  ApiServices() {
    _dio = Dio(
      BaseOptions(
          // v1 for tester and v2 for developer.
         // baseUrl: ApiUrls.baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30)),
    )..interceptors.add(ApiResponses());
  }

  ///******************GetDeviceID******************///
  static Future<String> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      await CommonSharedPreferences.setPreferences(
          PrefKeys.deviceUniqueId, iosDeviceInfo.identifierForVendor);
      return iosDeviceInfo.identifierForVendor;
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      await CommonSharedPreferences.setPreferences(
          PrefKeys.deviceUniqueId, androidDeviceInfo.androidId);
      return androidDeviceInfo.androidId;
    }
  }

  // -----------------------get Movie  api----------------------------
  Future<MoviesDataResponseModel?> getMovieListApi(String query, int page) async {
    try {

      String token =
      await CommonSharedPreferences.getPreferences(PrefKeys.loginToken);
      _dio?.options.headers["Authorization"] = token;
      Response response = await _dio!.get("${ApiUrls.baseUrl}$query&page=$page&${ApiUrls.apikey}");
      return MoviesDataResponseModel.fromJson(response.data);

    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      // Handle network errors, specifically for host lookup failure
      if (error is DioException &&
          error.error is SocketException &&
          error.error.toString().contains('Failed host lookup')) {
        return MoviesDataResponseModel.fromJson(internetCon);
      }
      return MoviesDataResponseModel.fromJson(errorRes);
    }
  }

  // -----------------------get Movie Detailapi----------------------------
  Future<MovieDetailResponseModel?> getMovieDetailApi(String imdbId) async {
    try {

      String token =
      await CommonSharedPreferences.getPreferences(PrefKeys.loginToken);
      _dio?.options.headers["Authorization"] = token;
      Response response = await _dio!.get("https://www.omdbapi.com/?i=$imdbId&${ApiUrls.apikey}");
      return MovieDetailResponseModel.fromJson(response.data);

    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      // Handle network errors, specifically for host lookup failure
      if (error is DioException &&
          error.error is SocketException &&
          error.error.toString().contains('Failed host lookup')) {
        return MovieDetailResponseModel.fromJson(internetCon);
      }
      return MovieDetailResponseModel.fromJson(errorRes);
    }
  }
}
