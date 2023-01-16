import 'package:get/get.dart';
import 'package:flutter_core/controller/SplashController.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}