import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_core/Themes/DarkTheme.dart';
import 'package:flutter_core/core/AppStrings.dart';
import 'package:flutter_core/routes/pages.dart';
import 'package:flutter_core/routes/routes.dart';


void main() {
  runApp(
    GetMaterialApp(
      title: AppStrings.appName,
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Pages.pages,
    ),
  );
}
