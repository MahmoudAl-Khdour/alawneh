import 'package:alawneh/res/assets_res.dart';
import 'package:alawneh/view/pages/login_page/view/login_page.dart';
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
      home: const LoginPage(),
    );
  }
}
