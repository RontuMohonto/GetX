import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studio_projects/view/Counter/UI.dart';
import 'package:studio_projects/view/Getx/UI.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: getX(),
    );

  }
}
