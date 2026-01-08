import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../controller/auth/regController.dart';
import '../../../controller/widgets/SignUpName_Widget.dart';
import '../../../controller/widgets/SignUpNumber_widget.dart';
import '../../../controller/widgets/SignUpPassword_widget.dart';
import '../../../controller/widgets/custom_button.dart';
import '../../../controller/widgets/text.dart';

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController numberC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            // TITLE
            CustomText(
              text: 'Let’s Get Started',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade800,
            ),
            SizedBox(height: 5),
            CustomText(
              text: 'Create an account to continue',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade500,
            ),
            SizedBox(height: 20),

            // NAME
            CustomText(
              text: "Name",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            NameFormField(
              nameC: nameC,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter name";
                }
                return null;
              },
              title: "name",
            ),

            SizedBox(height: 10),

            // NUMBER
            CustomText(
              text: "Phone Number",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            NumberFormField(
              numberC: numberC,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter phone";
                } else if (!RegExp(r'^(01)[0-9]{9}$').hasMatch(v)) {
                  return "please enter valid phone";
                }
                return null;
              },
              title: "number",
            ),

            SizedBox(height: 10),

            // PASSWORD
            CustomText(
              text: "Password",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            PasswordForm_widget(
              passC: passC,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter password";
                } else if (!RegExp(
                  r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%&*]).{8,}$',
                ).hasMatch(v)) {
                  return "Password must be strong";
                }
                return null;
              },
              title: "password",
            ),

            SizedBox(height: 20),

            // BUTTON
            isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.green))
                : CustomButton_widget(
                    title: "Register",
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) return;

                      var userdata = {
                        "name": nameC.text,
                        "phone": numberC.text,
                        "password": passC.text,
                      };

                      isLoading = true;
                      setState(() {});

                      bool status = await RegController().CreateAccoutFunction(
                        data: userdata,
                      );

                      isLoading = false;
                      setState(() {});
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
