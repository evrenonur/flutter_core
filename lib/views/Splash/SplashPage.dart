import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_core/controller/SplashController.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
