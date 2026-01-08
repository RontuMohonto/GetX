import 'package:flutter/material.dart';
class Login_phone_field extends StatelessWidget {
  const Login_phone_field({
    super.key,
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneNumberController,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return "please enter phone";
        } else {
          return "";
        }
      },
      decoration: InputDecoration(
        hintText: "please enter your phone number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
