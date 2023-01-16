import 'package:flutter_core/routes/routes.dart';
import 'package:flutter_core/utils/StorageManager.dart';
import 'package:get/get.dart';



class HomeController extends GetxController with StorageManager {

  Future<void> logout() async {
    await clearData();
    Get.offAllNamed(Routes.login);
  }


}