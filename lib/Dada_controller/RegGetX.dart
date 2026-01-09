import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegGetxController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameC = TextEditingController();
  final TextEditingController numberC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoading = false;
}
