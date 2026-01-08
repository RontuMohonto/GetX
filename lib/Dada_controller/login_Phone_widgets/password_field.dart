import 'package:flutter/material.dart';
class login_password_form extends StatelessWidget {
  const login_password_form({
    super.key,
    required this.PasswordController, required this.validator, required this.title,
  });

  final TextEditingController PasswordController;
  final FormFieldValidator validator;
  final String title;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: PasswordController,
      validator: validator,
      decoration: InputDecoration(
        hintText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
