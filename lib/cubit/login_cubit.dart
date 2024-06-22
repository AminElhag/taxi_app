import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:taxi_app/common/globs.dart';
import 'package:taxi_app/common/service_call.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  void submitLogin(String mobile, String userType) {
    try {
      emit(LoginHUDState());
      ServiceCall.post(
        {
          "user_type": userType,
          "mobile": mobile,
          "os_type": (Platform.isAndroid)
              ? "Android"
              : (Platform.isIOS)
                  ? "IOS"
                  : "Unknown",
          "push_type": "",
          "socked_id": ""
        },
        SVKey.svLogin,
        withSuccess: (response) async {
          if ((response[KKey.status] as String? ?? "") == "1") {
            ServiceCall.userObj = response[KKey.payload] as Map? ?? {};
            ServiceCall.userType =
                ServiceCall.userObj["user_type"] as int? ?? 1;

            Globs.udSet(ServiceCall.userObj, Globs.userPayload);
            Globs.udBoolSet(true, Globs.userLogin);

            emit(LoginApiResultState());
            emit(LoginInitialState());
          } else {
            emit(LoginErrorState(response[KKey.message] ?? Message.fail));
          }
        },
        withFailure: (error) async {
          emit(LoginErrorState(error));
        },
      );
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
