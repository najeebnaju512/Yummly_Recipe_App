import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:recipe_app/presentation/splashscreen/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app_config/app_config.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late SharedPreferences sharedPreferences;
  late bool checkLogged;

  Future<void> checkUserLogined() async {
    sharedPreferences = await SharedPreferences.getInstance();
    checkLogged = sharedPreferences.getBool(AppConfig.status) ?? false;
  }

  @override
  void initState() {
    checkUserLogined().then((value) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => checkLogged ? BottomNav() : IntroPage()),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/logo_rec.png"),
            ),
          ],
        ),
      ),
    );
  }
}
