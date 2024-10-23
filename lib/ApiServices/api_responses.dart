import 'package:dio/dio.dart';

import '../utils/PrefKeys.dart';
import '../utils/common_shared_preferences.dart';
import 'api_services.dart';
import 'api_utils.dart';

class ApiResponses extends Interceptor {
  AppUtils appUtils = AppUtils();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    // if (err.response?.statusCode == 401) {
    //   await ApiServices().getAuthTokenApi()?.then((value) async {
    //     if (value?.status != null && value?.status == true) {
    //       await CommonSharedPreferences.setPreferences(PrefKeys.authToken, value?.data?.authToken ?? "");
    //     }
    //   });
    //   await ApiServices.getId();
    //   // NavigationService.navigatorKey.currentState
    //   //     ?.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ProfileSelectionScreen()), (route) => false);
    //   // Fluttertoast.showToast(msg: err.response?.data['message'] ?? "", toastLength: Toast.LENGTH_LONG);
    // }
    return super.onError(err, handler);
  }
}
