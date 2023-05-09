import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../../constants/constant_data.dart';
import '../../constants/nav_screens.dart';
import '../header_widget/header_widget.dart';

class BaseWidget extends StatefulWidget {
  const BaseWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          splashRadius: 50,
          notchMargin: 0,
          elevation: 50,
          height: 75,
          activeIndex: bottomNavIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.sharpEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          onTap: (index) => setState(() => bottomNavIndex = index),
          itemCount: navScreens.length,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? AppColor.globalDefaultColor : Colors.grey[400];
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navScreens[index].icon,
                  size: 28,
                  color: color,
                ),
                const SizedBox(height: 4),
                Text(
                  navScreens[index].name,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
          //other params
        ),
        body: Stack(
          children: [
            navScreens[bottomNavIndex].widget,
            navScreens[bottomNavIndex].navBarItem == NavBarItem.home
                ? Container()
                : HeaderWidget(
                    onPressed: () {
                      setState(() {
                        bottomNavIndex = 0;
                      });
                    },
                    centerTitle: true,
                    containerSize: 80,
                    title: navScreens[bottomNavIndex].name,
                    haveBack: true,
                    haveLogo: false,
                  ),
          ],
        ),
      ),
    );
  }
}
