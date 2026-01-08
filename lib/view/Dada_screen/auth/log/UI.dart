import 'dart:developer';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:dada_garments_full_with_api/screen/home/UI.dart';
import 'package:flutter/material.dart';
import '../../../controller/auth/loginController.dart';
import '../../../controller/login_Phone_widgets/password_field.dart';
import '../../../controller/login_Phone_widgets/phonefield.dart';
import '../../../controller/widgets/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool isLoading = false;

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
          key: _formKey,
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
                  phoneNumberController: phoneNumberController,
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
                  PasswordController: PasswordController,
                  validator: (value) {},
                  title: "Please enter your password",
                ),
              ),

              SizedBox(height: 15),

              // Logbutton
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.green.shade700,
                      ),
                    )
                  : CustomButton_widget(
                      title: "Login",
                      onTap: () async {
                        isLoading = true;
                        setState(() {});

                        var status = await LoginController.login(
                          phone: phoneNumberController.text,
                          password: PasswordController.text,
                        );

                        isLoading = false;
                        setState(() {});

                        if (status == true) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => home()),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
