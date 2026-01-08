import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.nameC,
    required this.validator,
    required this.title,
  });

  final TextEditingController nameC;
  final FormFieldValidator validator;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameC,
      validator: validator,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "please enter your $title",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green.shade900),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green.shade900),
        ),
      ),
    );
  }
}
