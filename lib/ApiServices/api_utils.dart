import 'package:shared_preferences/shared_preferences.dart';

import '../utils/PrefKeys.dart';

class AppUtils {

  void setUserData(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', userName);
  }


  void setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', token);
  }

  Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String authToken = prefs.getString('authToken') ?? "";
    return authToken;
  }

  void setDeviceId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefKeys.deviceId, id);
  }

  Future<String> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String deviceId = prefs.getString('deviceId') ?? "";
    return deviceId;
  }

  void setDeviceUniqueId(String uniqueId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceUniqueId', uniqueId);
  }

  Future<String> getDeviceUniqueId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String deviceUniqueId = prefs.getString('deviceUniqueId') ?? "";
    return deviceUniqueId;
  }

  void setDeviceType(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('deviceType', type);
  }

  Future<String> getDeviceType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String deviceType = prefs.getString('deviceType') ?? "";
    return deviceType;
  }
}
