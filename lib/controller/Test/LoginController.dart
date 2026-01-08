import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Dada_controller/auth/loginController.dart';
import '../../view/Dada_screen/home/UI.dart';

class LoginFunctionController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool isLoading = false;

  loginFunction() async {
    isLoading = true;
    update();
    var status = await LoginController.login(
      phone: phoneNumberController.text,
      password: PasswordController.text,
    );

    log("=============111111111111111");

    isLoading = false;
    log("=============22222222222222");

    update();

    // if (status == true) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => home(),
    //     ), //Navigate to homepage
    //   );
    // }
  }
}
