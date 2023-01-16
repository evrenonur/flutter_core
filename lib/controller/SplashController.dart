import 'package:flutter_core/routes/routes.dart';
import 'package:flutter_core/utils/StorageManager.dart';
import 'package:get/get.dart';


class SplashController extends GetxController with StorageManager {

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 3), () async {
      final token = await getData("token");
      if (token != null) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

}