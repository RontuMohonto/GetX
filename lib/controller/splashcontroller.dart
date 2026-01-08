import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../view/Dada_screen/auth/UI.dart';
import '../view/Dada_screen/home/UI.dart';

class SplashController extends GetxController {
  TimerFunction() async {
    FlutterSecureStorage _storage = FlutterSecureStorage();
    var t = await _storage.read(key: "token");
    log("==========TT : $t======");
    if (t == null) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => AuthScreen()),
      // );
      Get.to(() => AuthScreen());
    } else {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
      Get.to(() => home());
    }
  }
  @override
  void onReady() {
    TimerFunction();
    super.onReady();
  }
}
