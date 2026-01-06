import 'package:flutter/material.dart';

class getX extends StatelessWidget {
  const getX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You have tapped  this times...",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "1",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.remove, color: Colors.red, size: 30),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.add, color: Colors.green, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
