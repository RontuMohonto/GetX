import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

class CustomButton_widget extends StatelessWidget {
  const CustomButton_widget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            colors: [
              Colors.green.shade600,
              Colors.green.shade400,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.green.shade300.withOpacity(0.5),
              blurRadius: 10,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: CustomText(
            text: title,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
