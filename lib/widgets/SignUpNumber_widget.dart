import 'package:flutter/material.dart';
class NumberFormField extends StatelessWidget {
  const NumberFormField({
    super.key,
    required this.numberC,
    required this.validator,
    required this.title,
  });

  final TextEditingController numberC;
  final FormFieldValidator validator;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberC,
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
