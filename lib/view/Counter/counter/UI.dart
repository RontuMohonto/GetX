import 'package:flutter/material.dart';

class counter extends StatefulWidget {
  const counter({super.key});

  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  int counter = 0;

  increment() {
    counter++;
    setState(() {});
  }

  decremnet() {
    counter--;
    setState(() {});
  }

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
                counter.toString(),
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
                onPressed: () {
                  decremnet();
                },
                child: Icon(Icons.remove, color: Colors.red, size: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  increment();
                },
                child: Icon(Icons.add, color: Colors.green, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
