import 'package:alawneh/view/pages/calendar_page/view/calendar_page.dart';
import 'package:alawneh/view/pages/employee_info/view/employee_info.dart';
import 'package:alawneh/view/pages/voting_page/view/voting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home_page/view/home_page.dart';

class BottomNavBarModel {
  NavBarItem navBarItem;
  IconData icon;
  String name;
  Widget widget;

  BottomNavBarModel({
    required this.widget,
    required this.navBarItem,
    required this.name,
    required this.icon,
  });
}

enum NavBarItem {
  home,
  calendar,
  voting,
  employeeInfo,
}

List navScreens = <BottomNavBarModel>[
  BottomNavBarModel(
    name: 'Home'.tr,
    icon: Icons.home_outlined,
    navBarItem: NavBarItem.home,
    widget: const HomePage(),
  ),
  BottomNavBarModel(
    name: 'Calendar'.tr,
    icon: Icons.calendar_month_outlined,
    navBarItem: NavBarItem.calendar,
    widget: const CalenderPage(),
  ),
  BottomNavBarModel(
    name: 'Voting'.tr,
    icon: Icons.data_exploration_outlined,
    navBarItem: NavBarItem.voting,
    widget: const VotingPage(),
  ),
  BottomNavBarModel(
    name: 'Account'.tr,
    icon: Icons.person_outline_sharp,
    navBarItem: NavBarItem.employeeInfo,
    widget: const EmployeeInfo(),
  ),
];
