import 'package:flutter/material.dart';

class nextscreen extends StatefulWidget {
  const nextscreen({super.key});

  @override
  State<nextscreen> createState() => _nextscreenState();
}

class _nextscreenState extends State<nextscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "getX",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(child: Text("getX")),
    );
  }
}
