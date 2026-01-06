import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/view/Counter/UI.dart';
import 'package:studio_projects/view/Getx/UI.dart';
import 'package:studio_projects/view/ProductList/UI.dart';
import 'package:studio_projects/view/ProductList/with_getx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
    home: ProductLIst_getx(),
    );

  }
}
