import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/common/globs.dart';

typedef ResSuccess = Future<void> Function(Map<String, dynamic>);
typedef ResFailure = Future<void> Function(dynamic);

class ServiceCall {
  static Map userObj = {};
  static int userType = 1;

  static void post(
    Map<String, dynamic> parameter,
    String path, {
    bool isTokenApi = false,
    ResSuccess? withSuccess,
    ResFailure? withFailure,
  }) {
    Future(() {
      try {
        var headers = {"Content-Type": "application/x-www-from-urlencoded"};
        if (isTokenApi) {
          var token = Globs.udValueString("token");
          headers["access_token"] = token;
        }

        http.post(Uri.parse(path), body: parameter, headers: headers).then(
          (value) {
            if (kDebugMode) {
              print(value.body);
            }
            try {
              var obj = json.decode(value.body) as Map<String, dynamic>? ?? {};
              if (withSuccess != null) withSuccess(obj);
            } catch (e) {
              if (withFailure != null) withFailure(e.toString());
            }
          },
        ).catchError((e) {
          if (withFailure != null) withFailure(e.toString());
        });
      } catch (e) {
        if (withFailure != null) withFailure(e.toString());
      }
    });
  }
}
