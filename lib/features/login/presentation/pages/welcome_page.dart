import 'package:flutter/material.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common_widget/round_button.dart';
import 'package:taxi_app/features/login/presentation/pages/mobile_number_page.dart';
import 'package:taxi_app/features/login/presentation/pages/create_profile_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      );

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/taxi_welcome_img.jpg",
            fit: BoxFit.cover,
            width: context.width,
            height: context.height,
          ),
          Container(
            height: context.height,
            width: context.width,
            color: Colors.black54,
          ),
          SafeArea(
            child: Column(
              children: [
                Image.asset(
                  "assets/img/taxi-app.png",
                  width: context.width * 0.25,
                  height: context.height * 0.25,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: RoundButton(
                    backgroundColor: TColor.primary,
                    title: "Sing In",
                    onPressed: () {
                      Navigator.push(context, MobileNumberPage.route());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, CreateProfilePage.route());
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
