import 'package:flutter/material.dart';
import 'package:flutter_core/services/interfaces/IAuthService.dart';
import 'package:get/get.dart';
import 'package:flutter_core/model/Request/LoginRequest.dart';
import 'package:flutter_core/model/Request/RegisterRequestModel.dart';
import 'package:flutter_core/routes/routes.dart';
import 'package:flutter_core/utils/AlertManager.dart';

class AuthController extends GetxController with AlertManager {
  late final IAuthService _authService;

  AuthController(this._authService);

  final loginFormKey = GlobalKey<FormState>(debugLabel: '_loginFormKey');
  final registerFormKey = GlobalKey<FormState>(debugLabel: '_registerFormKey');
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordControllerRepeat = TextEditingController();
  final nameController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool passwordVisibleLogin = true.obs;
  RxBool passwordVisibleRegister = true.obs;
  RxBool passwordVisibleRepeat = true.obs;

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;

      try {
        isLoading.value = true;
        final response = await _authService.login(
          LoginRequest(
            email: email,
            password: password,
          ),
        );
        if (response != null) {
          if (response.code == 200) {
            Get.offAllNamed(Routes.home);
          }
        }
      } catch (e) {
        error("Hata!", e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      final name = nameController.text;
      final passwordRepeat = passwordControllerRepeat.text;

      if (password != passwordRepeat) {
        error("Hata!", "Şifreler uyuşmuyor.");
        return;
      }
      try {
        isLoading.value = true;
        final response = await _authService.register(
            RegisterRequestModel(email: email, password: password, name: name));
        if (response != null) {
          clearControllers();
          success("Başarılı!", "Kayıt başarılı.");
        } else {
          error("Hata!", "Kayıt başarısız.");
        }
      } catch (e) {
        error("Hata!", e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  clearControllers() {
    emailController.clear();
    passwordController.clear();
    passwordControllerRepeat.clear();
    nameController.clear();

  }
}
