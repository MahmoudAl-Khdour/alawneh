import 'package:get/get.dart';

import '../../view/pages/login_page/controller/login_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // final repository = Get.put<HttpRepository>(
    //   HttpRepositoryImpl(),
    //   permanent: true,
    // );
    // Get.put(
    //   CacheUtils(GetStorage()),
    //   permanent: true,
    // );
    // final cacheUtils = Get.find<CacheUtils>();

    Get.create(() => LoginController(
        // httpRepository: repository,
        // cacheUtils: cacheUtils,
        ));
  }
}
