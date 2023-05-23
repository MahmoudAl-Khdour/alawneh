import 'package:alawneh/res/assets_res.dart';
import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:alawneh/view/pages/login_page/view/login_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/app_bindings/app_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AssetsRes.PLUGIN_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialBinding: AppBindings(),
        home: AnimatedSplashScreen(
          duration: 2000,
          splash: AssetsRes.ALAWNEH,
          splashIconSize: 2000,
          centered: false,
          nextScreen: const LoginPage(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: AppColor.globalDefaultColor,
        ));
  }
}
