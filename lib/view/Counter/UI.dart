import 'package:flutter/material.dart';

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Column(
        children: [
          Text("You have tapped  this times"),
          Text("01"),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.add, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
