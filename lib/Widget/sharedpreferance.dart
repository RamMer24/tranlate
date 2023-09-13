import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Modals/LoginModal.dart';

class SaveDataLocal {
  static SharedPreferences? prefs;
  static String userData = 'UserData';

  static saveLogInData(UserModal usermodal) async {
    prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(usermodal.toJson());
    await prefs?.setString(userData, json);
  }

  static getDataFromLocal() async {
    prefs = await SharedPreferences.getInstance();
    String? userString = prefs?.getString(userData);
    if (userString != null) {
      Map userMap = jsonDecode(userString);
      UserModal user = UserModal.fromJson(userMap);
      return user;
    } else {
      return null;
    }
  }

  static clearUserData() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.clear();
  }
}