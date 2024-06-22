import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/features/login/presentation/pages/language_selector_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    loadingNextPage();
    super.initState();
  }

  void loadingNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    naveToLanguagePage();
  }

  void naveToLanguagePage() {
    Navigator.push(context, LanguageSelectorPage.route());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: TColor.primary,
          ),
          Image.asset(
            "assets/img/taxi-app.png",
            width: context.width * 0.25,
          ),
        ],
      ),
    );
  }
}
