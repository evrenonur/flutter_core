import 'package:get/get.dart';
import 'package:flutter_core/controller/AuthController.dart';
import 'package:flutter_core/services/AuthService.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(AuthService()));
  }
}