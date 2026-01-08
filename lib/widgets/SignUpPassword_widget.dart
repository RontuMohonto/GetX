import 'package:flutter/material.dart';
class PasswordForm_widget extends StatelessWidget {
  const PasswordForm_widget({
    super.key,
    required this.passC,
    required this.validator,
    required this.title,
  });

  final TextEditingController passC;
  final FormFieldValidator validator;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passC,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "please enter your $title",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
