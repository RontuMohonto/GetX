import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../ProductScreen/UI.dart';
import '../auth/UI.dart';
import '../home/UI.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //Splash Function

  // @override
  // void initState() {
  //   TimerFunction();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image(image: AssetImage("assets/images/splash.png"))),
    );
  }
}
