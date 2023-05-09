import 'package:alawneh/res/assets_res.dart';
import 'package:alawneh/view/components/constants/app_color.dart';
import 'package:alawneh/view/pages/login_page/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeInfo extends StatefulWidget {
  const EmployeeInfo({Key? key}) : super(key: key);

  @override
  State<EmployeeInfo> createState() => _InformationState();
}

class _InformationState extends State<EmployeeInfo> {
  @override
  Widget build(BuildContext context) {
    //0852
    return Padding(
      padding: const EdgeInsets.only(
        top: 80,
      ),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 220,
                decoration: const BoxDecoration(
                  color: AppColor.globalDefaultColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Column(
                children: const [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: AppColor.globalWhiteColor,
                      child: Image(
                        image: AssetImage(AssetsRes.ALAWNEH_LOGO),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Mahmoud Al-khdour',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  border: Border.all(
                    color: AppColor.globalDefaultColor,
                    width: 0.4,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.work_outline,
                        color: AppColor.globalDefaultColor,
                        size: 28,
                      ),
                      title: Text(
                        'Work Number'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor,
                        ),
                      ),
                      subtitle: Text(
                        '444',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.email_outlined,
                        color: AppColor.globalDefaultColor,
                        size: 28,
                      ),
                      title: Text(
                        'Email'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor,
                        ),
                      ),
                      subtitle: Text(
                        'mahmoud.h.alkhdour@gamil.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.phone,
                        color: AppColor.globalDefaultColor,
                        size: 28,
                      ),
                      title: Text(
                        'Phone'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor,
                        ),
                      ),
                      subtitle: Text(
                        '+962788314198',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: AppColor.globalDefaultColor,
                        size: 28,
                      ),
                      title: Text(
                        'Location'.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor,
                        ),
                      ),
                      subtitle: Text(
                        'Jordan - Zarqa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.globalDefaultColor.withOpacity(0.6),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            indent: 30,
            endIndent: 30,
            color: AppColor.globalDefaultColor.withOpacity(0.4),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.globalDefaultColor,
                  width: 0.4,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListTile(
                onTap: () {
                  // Get.to(const ChangePassword());
                },
                title: Text(
                  'Change Password'.tr,
                  style: const TextStyle(
                    color: AppColor.globalDefaultColor,
                  ),
                ),
                leading: const Icon(
                  Icons.password,
                  color: AppColor.globalDefaultColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.globalDefaultColor,
                  width: 0.4,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListTile(
                onTap: () {
                  // logout();
                  Get.offAll(() => const LoginPage());
                },
                title: Text(
                  'Logout'.tr,
                  style: const TextStyle(
                    color: AppColor.globalDefaultColor,
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  color: AppColor.globalDefaultColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
      ),
    );
  }

  // Future<UserInformationModel?> getUserInformation() async {
  //   HttpRepository httpRepository = HttpRepositoryImpl();
  //   CacheUtils cacheUtils = CacheUtils(GetStorage());
  //
  //   late Rx<Response?> userInformationResponse = Rx<Response?>(null);
  //   UserInformationModel? userInformationModel = UserInformationModel();
  //
  //   try {
  //     userInformationResponse.value = await httpRepository.getUserInformation(
  //       empId: cacheUtils.getEmpId()!,
  //       token: cacheUtils.getToken()!,
  //     );
  //
  //     if (userInformationResponse.value == null) {
  //       return null;
  //     }
  //     userInformationModel =
  //         UserInformationModel.fromJson(userInformationResponse.value!.body);
  //
  //     if (userInformationModel.punchStatus != null ||
  //         userInformationModel.punchStatus!.isEmpty) {
  //       cacheUtils.savePunchStatus(
  //           punchStatus: userInformationModel.punchStatus!);
  //     } else {
  //       Get.snackbar(
  //         'User Information'.tr,
  //         'Something is wrong',
  //         icon: const Icon(
  //           Icons.warning,
  //           color: Colors.white,
  //         ),
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: globalDefaultColor,
  //         borderRadius: 15,
  //         margin: const EdgeInsets.all(15),
  //         colorText: Colors.white,
  //         duration: const Duration(seconds: 4),
  //         isDismissible: true,
  //         dismissDirection: DismissDirection.horizontal,
  //         forwardAnimationCurve: Curves.easeOutBack,
  //       );
  //       return null;
  //     }
  //
  //     return userInformationModel;
  //   } catch (e) {
  //     Get.snackbar(
  //       'User Information'.tr,
  //       "Something is wrong".tr,
  //       icon: const Icon(
  //         Icons.warning,
  //         color: Colors.white,
  //       ),
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: globalDefaultColor,
  //       borderRadius: 15,
  //       margin: const EdgeInsets.all(15),
  //       colorText: Colors.white,
  //       duration: const Duration(seconds: 4),
  //       isDismissible: true,
  //       dismissDirection: DismissDirection.horizontal,
  //       forwardAnimationCurve: Curves.easeOutBack,
  //     );
  //     e.printError();
  //   }
  //   return null;
  // }

  // logout() {
  //   HttpRepository httpRepository = HttpRepositoryImpl();
  //   CacheUtils cacheUtils = CacheUtils(GetStorage());
  //   try {
  //     httpRepository.logout(
  //       empId: cacheUtils.getEmpId()!,
  //       token: cacheUtils.getToken()!,
  //     );
  //     Get.offAll(() => const LoginScreen());
  //     cacheUtils.logout();
  //   } catch (e) {
  //     e.printError();
  //   }
  // }

  Future refresh() async {
    setState(() {});
  }
}
