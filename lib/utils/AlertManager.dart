import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_core/routes/routes.dart';


mixin AlertManager{
  void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.check,
        color: Colors.green,
      ),

    );
  }

  void error(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
      ),
    );
  }

  void info(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      icon: const Icon(
        Icons.info,
        color: Colors.blue,
      ),
    );
  }

  void loginTo(){
    Get.offAllNamed(Routes.login);
  }

}