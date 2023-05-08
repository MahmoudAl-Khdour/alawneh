import 'package:alawneh/res/assets_res.dart';
import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:alawneh/view/pages/login_page/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

import '../../../components/components/default_form_field/default_form_field.dart';
import '../../../components/components/size_config/size_config.dart';
import '../../../components/widgets/base_widget/base_widget.dart';

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.3,
              decoration: const BoxDecoration(
                  color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetsRes.LOGIN_BACKGROUND),
                  )),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 150,
                ),
                child: Container(
                  height: SizeConfig.screenHeight - 150,
                  decoration: BoxDecoration(
                    color: AppColor.globalWhiteColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 20,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                            alignment: Alignment.center,
                            child: Image(
                              height: 85,
                              image: AssetImage(AssetsRes.ALAWNEH_LOGO),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Login to your account'.tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              'Job Id'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: DefaultFormField(
                              validator: (id) {
                                if (id == null || id.isEmpty) {
                                  return 'Job Id Required'.tr;
                                }
                                return null;
                              },
                              controller: controller.jobIdController,
                              isPassword: false,
                              enabled: true,
                              readOnly: false,
                              radius: 15,
                              autofocus: false,
                              focusBorderColor: AppColor.globalDefaultColor,
                              textColor: AppColor.globalDefaultColor,
                              filled: true,
                              fillColor:
                                  AppColor.globalBackgroundTextFormFieldColor,
                              hintStyle: TextStyle(
                                color: AppColor.globalHintColor,
                              ),
                              hint: 'Enter your Job Id'.tr,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Obx(() {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: DefaultFormField(
                                validator: (pass) {
                                  if (pass == null || pass.isEmpty) {
                                    return 'Password Required';
                                  }
                                  return null;
                                },
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.hidePassFun();
                                  },
                                  icon: Icon(
                                    controller.ico.value,
                                    size: 23,
                                  ),
                                  color: AppColor.globalDefaultColor,
                                ),
                                controller: controller.passwordController,
                                minLines: 1,
                                maxLines: 1,
                                isPassword: controller.hidePass.value,
                                enabled: true,
                                readOnly: false,
                                radius: 15,
                                autofocus: false,
                                focusBorderColor: AppColor.globalDefaultColor,
                                textColor: AppColor.globalDefaultColor,
                                filled: true,
                                fillColor:
                                    AppColor.globalBackgroundTextFormFieldColor,
                                hintStyle: TextStyle(
                                  color: AppColor.globalHintColor,
                                ),
                                hint: 'Password'.tr,
                              ),
                            );
                          }),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: Center(
                              child: ArgonButton(
                                height: 50,
                                roundLoadingShape: true,
                                width: SizeConfig.screenWidth,
                                onTap: (startLoading, stopLoading,
                                    btnState) async {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    Get.to(() => const BaseWidget());
                                    // await controller.logIn();
                                  } else {
                                    Get.snackbar(
                                      'Login'.tr,
                                      'Please enter required field'.tr,
                                      icon: const Icon(
                                        Icons.warning,
                                        color: AppColor.globalDefaultColor,
                                      ),
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor:
                                          AppColor.globalWhiteColor,
                                      borderRadius: 15,
                                      margin: const EdgeInsets.all(15),
                                      colorText: AppColor.globalDefaultColor,
                                      duration: const Duration(seconds: 2),
                                      isDismissible: true,
                                      dismissDirection:
                                          DismissDirection.horizontal,
                                      forwardAnimationCurve: Curves.easeInBack,
                                    );
                                  }
                                },
                                loader: const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                borderRadius: 15,
                                color: AppColor.globalButtonColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
