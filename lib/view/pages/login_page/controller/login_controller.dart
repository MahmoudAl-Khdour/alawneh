import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  final formKey = GlobalKey<FormState>();

  final jobIdController = TextEditingController();
  final passwordController = TextEditingController();
  Rx<IconData> ico = Icons.visibility_outlined.obs;
  RxBool hidePass = true.obs;

  hidePassFun() {
    if (hidePass.value) {
      hidePass.value = false;
      ico.value = Icons.visibility_off_outlined;
      return;
    } else {
      hidePass.value = true;
      ico.value = Icons.visibility_outlined;
      return;
    }
  }
}
