import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:quickalert/quickalert.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common/globs.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/cubit/login_cubit.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  static route(String phoneNumber) => MaterialPageRoute(
        builder: (context) => OTPPage(
          phoneNumber: phoneNumber,
        ),
      );

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final OtpTimerButtonController _otpTimeController =
      OtpTimerButtonController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = "";
  var code = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onSendSMS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_rounded)),
        title: Text(
          "OTP Verification",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginHUDState) {
            Globs.showHUD();
          } else if (state is LoginApiResultState) {
            Globs.hideHUD();
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Success',
              text: "Sign api is call successfully",
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              textColor: Colors.white,
            );
          } else if (state is LoginErrorState) {
            Globs.hideHUD();
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: 'Error',
              text: state.errorMessage,
              backgroundColor: Colors.black,
              titleColor: Colors.white,
              textColor: Colors.white,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'Enter the 4-digit code send to you at \n',
                      style: TextStyle(color: TColor.primaryText),
                    ),
                    TextSpan(
                      text: '${widget.phoneNumber} ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: TColor.primaryText,
                      ),
                    ),
                    TextSpan(
                        text: 'Edit',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                OtpPinField(
                  key: _otpPinFieldController,
                  textInputAction: TextInputAction.done,
                  maxLength: 6,
                  fieldWidth: 40,
                  onSubmit: (text) {
                    code = text;
                    smsVerification();
                  },
                  onChange: (text) {},
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                  backgroundColor: TColor.primary,
                  title: "Continue",
                  onPressed: () {
                    smsVerification();
                    /*Navigator.push(context, CreateProfilePage.route());*/
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                OtpTimerButton(
                  controller: _otpTimeController,
                  height: 50,
                  onPressed: () {
                    _otpTimeController.loading();
                    Future.delayed(const Duration(seconds: 10), () {
                      onSendSMS();
                      _otpTimeController.startTimer();
                    });
                  },
                  text: Text(
                    'Resend OTP',
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 16,
                    ),
                  ),
                  backgroundColor: TColor.secondary,
                  textColor: Colors.white,
                  loadingIndicatorColor: Colors.red,
                  radius: 30,
                  duration: 60,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onSendSMS() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: const Duration(minutes: 1),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: e.message,
            backgroundColor: Colors.black,
            titleColor: Colors.white,
            textColor: Colors.white,
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
        },
      );
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error',
        text: e.toString(),
        backgroundColor: Colors.black,
        titleColor: Colors.white,
        textColor: Colors.white,
      );
    }
  }

  void smsVerification() async {
    if (code.length < 6) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.warning,
        title: 'Invalid',
        text: "Please make sure of otp",
        backgroundColor: Colors.black,
        titleColor: Colors.white,
        textColor: Colors.white,
      );
    }

    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: code);
      final User? user = (await auth.signInWithCredential(credential)).user;
      if (user != null) {
        callLoginApi(user.uid);
      } else {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          title: 'Invalid',
          text: "User Not exited",
          backgroundColor: Colors.black,
          titleColor: Colors.white,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print("--------------------------------------------------");
      print(e);
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Error',
        text: e.toString(),
        backgroundColor: Colors.black,
        titleColor: Colors.white,
        textColor: Colors.white,
      );
    }
  }

  void callLoginApi(String uid) {
    context.read<LoginCubit>().submitLogin(widget.phoneNumber, "2");
  }
}
