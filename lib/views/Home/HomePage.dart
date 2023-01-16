import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_core/controller/HomeController.dart';
import 'package:flutter_core/core/AppStrings.dart';
import 'package:flutter_core/routes/routes.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Column(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.userAstronaut,
                      size: 100,
                      color: Colors.white,
                    ),
                    Text(
                      'Onur Evren',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),







            ListTile(
              title: const Text('Çıkış Yap'),
              leading: const FaIcon(
                FontAwesomeIcons.rightFromBracket,
                color: Colors.redAccent,
              ),
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
