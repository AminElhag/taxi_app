import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:taxi_app/main.dart';

class Globs {
  static const appName = "Taxi Driver";

  static const userPayload = "user_payload";
  static const userLogin = "user_login";

  static void showHUD({String status = "loading ..."}) async {
    await Future.delayed(const Duration(seconds: 1));
    EasyLoading.show(status: status);
  }

  static void hideHUD() {
    EasyLoading.dismiss();
  }

  static void udSet(dynamic data, String key) {
    var jsonString = json.encode(data);
    preferences?.setString(key, jsonString);
  }

  static void udStringSet(String data, String key) {
    preferences?.setString(key, data);
  }

  static void udBoolSet(bool data, String key) {
    preferences?.setBool(key, data);
  }

  static void udIntSet(int data, String key) {
    preferences?.setInt(key, data);
  }

  static void udDoubleSet(double data, String key) {
    preferences?.setDouble(key, data);
  }

  static dynamic udValue(String key) {
    return json.decode(preferences?.get(key) as String? ?? "{}");
  }

  static String udValueString(String key) {
    return preferences?.get(key) as String? ?? "";
  }

  static bool udValueBool(String key) {
    return preferences?.getBool(key) ?? false;
  }

  static bool udValueTureBool(String key) {
    return preferences?.getBool(key) ?? true;
  }

  static int udValueInt(String key) {
    return preferences?.getInt(key) ?? 0;
  }

  static double udValueDouble(String key) {
    return preferences?.getDouble(key) ?? 0.0;
  }

  static void udRemoveKey(String key) {
    preferences?.remove(key);
  }

  static Future<String> timeZone() async {
    try {
      return await FlutterTimezone.getLocalTimezone();
    } catch (e) {
      return "";
    }
  }
}

class SVKey {
  static const mainUrl = "http://localhost:3001";
  static const baseUrl = "$mainUrl/api/";
  static const nodeUrl = mainUrl;

  static const svLogin = "${baseUrl}login";
}

class KKey {
  static const payload = "payload";
  static const status = "status";
  static const message = "message";

  static const authToken = "auth_token";
}

class Message {
  static const success = "success";
  static const fail = "fail";
}
