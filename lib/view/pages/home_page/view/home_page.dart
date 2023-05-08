import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Column(
         children: [],
       ),
        Container(
          decoration: const BoxDecoration(
            color: AppColor.globalDefaultColor,
          ),
        ),
      ],
    );
  }
}
