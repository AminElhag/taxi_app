import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxi_app/common/color-extension.dart';
import 'package:taxi_app/common/http_override.dart';
import 'package:taxi_app/cubit/login_cubit.dart';
import 'package:taxi_app/features/login/presentation/pages/splash_page.dart';

SharedPreferences? preferences;

void main() async {
  HttpOverrides.global = HttpOverride();
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBhizSA22NNNAIJVX3gXzctS9EtOW7Nn88",
          appId: "1:511600685737:android:16e26911baff2e6e272fb8",
          messagingSenderId: "511600685737",
          projectId: "flutter-dev-dd4c4"));
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 5.0
    ..progressColor = TColor.secondaryText
    ..backgroundColor = TColor.primary
    ..indicatorColor = TColor.secondary
    ..textColor = TColor.secondaryText
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Taxi App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "NunitoSans",
          scaffoldBackgroundColor: TColor.bg,
          colorScheme: ColorScheme.fromSeed(seedColor: TColor.primary),
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          useMaterial3: true,
        ),
        home: const SplashPage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
