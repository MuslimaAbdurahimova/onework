import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  LocalStore._();

  static setOnBoarding(bool isBoarding) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setBool("OnBoarding", isBoarding);
  }

  static getOnBoarding() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getBool("OnBoarding");
  }

  static setAccessToken(String token) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setString("AccessToken", token);
  }

  static setRefreshToken(String token) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setString("RefreshToken", token);
  }

  static getAccessToken() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getString("AccessToken");
  }

  static getRefreshToken() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getString("RefreshToken");
  }
}
