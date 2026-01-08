import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../../Dada_controller/auth/loginController.dart';
import '../../../../Dada_controller/login_Phone_widgets/password_field.dart';
import '../../../../Dada_controller/login_Phone_widgets/phonefield.dart';
import '../../../../Dada_controller/widgets/custom_button.dart';
import '../../../../Dada_controller/widgets/text.dart';
import '../../../../controller/Test/LoginController.dart';
import '../../home/UI.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginFunctionController lc = Get.put(LoginFunctionController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Form(
          key: lc.formKey,
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //ttile
              CustomText(
                text: "Welcome Back",
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.green.shade800,
              ),
              CustomText(
                text: "Please enter your details to login",
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.green.shade500,
              ),

              SizedBox(height: 20),

              // number
              CustomText(
                text: "Phone Number",
                fontSize: 16,
                color: Colors.green.shade900,
                fontWeight: FontWeight.w600,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Login_phone_field(
                  phoneNumberController: lc.phoneNumberController,
                ),
              ),

              // pass
              CustomText(
                text: "Password",
                fontSize: 16,
                color: Colors.green.shade900,
                fontWeight: FontWeight.w600,
              ),
              //password con
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: login_password_form(
                  PasswordController: lc.PasswordController,
                  validator: (value) {},
                  title: "Please enter your password",
                ),
              ),

              SizedBox(height: 15),

              // Logbutton
              lc.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.green.shade700,
                      ),
                    )
                  : CustomButton_widget(
                      title: "Login",
                      onTap: lc.loginFunction,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
