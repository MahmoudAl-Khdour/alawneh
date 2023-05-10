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
      // home: ExamplePolls(),
    );
  }
}

// import 'dart:async';
//
// import 'package:alawneh/view/components/constants/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:starlight_popup_menu/starlight_popup_menu.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: const Center(
//         child: MenuVertical(),
//       ),
//     );
//   }
// }

// class StarClipper extends CustomClipper<Path> {
//   StarClipper();
//
//   double _degreeToRadian(double deg) => deg * (pi / 180.0);
//
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     double max = 2 * pi;
//
//     double width = size.width;
//     double halfWidth = width / 2;
//
//     double wingRadius = halfWidth;
//     double radius = halfWidth / 2;
//
//     double degreesPerStep = _degreeToRadian(360 / 6);
//     double halfDegreesPerStep = degreesPerStep / 2;
//
//     path.moveTo(width, halfWidth);
//
//     for (double step = 0; step < max; step += degreesPerStep) {
//       path.lineTo(halfWidth + wingRadius * cos(step),
//           halfWidth + wingRadius * sin(step));
//       path.lineTo(halfWidth + radius * cos(step + halfDegreesPerStep),
//           halfWidth + radius * sin(step + halfDegreesPerStep));
//     }
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
