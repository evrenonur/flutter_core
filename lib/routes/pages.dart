import 'package:get/get.dart';
import 'package:flutter_core/routes/Bindings/AuthBinding.dart';
import 'package:flutter_core/routes/Bindings/HomeBinding.dart';
import 'package:flutter_core/routes/Bindings/SplashBinding.dart';
import 'package:flutter_core/routes/routes.dart';
import 'package:flutter_core/views/Auth/LoginPage.dart';
import 'package:flutter_core/views/Auth/RegisterPage.dart';
import 'package:flutter_core/views/Home/HomePage.dart';
import 'package:flutter_core/views/Splash/SplashPage.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      binding: SplashBinding(),
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      binding: HomeBinding(),
      name: Routes.home,
      page: () => const HomePage(),
    ),

  ];
}
