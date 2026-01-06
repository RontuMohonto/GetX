import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studio_projects/controller/controller.dart';

class getX extends StatelessWidget {
  getX({super.key});

  final controllerGetx cc = Get.put(controllerGetx());

  @override
  Widget build(BuildContext context) {
    log("+=======Started .........==========");
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
              Obx(
                () => Text(
                  "${cc.counter}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  cc.decrement();
                },
                child: Icon(Icons.remove, color: Colors.red, size: 30),
              ),
              ElevatedButton(
                onPressed: () {
                  cc.increment();
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
