import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studio_projects/Dada_controller/widgets/text.dart';
import 'package:studio_projects/view/Dada_screen/auth/reg/RegSc.dart';

import '../../../Dada_controller/widgets/tabbar.dart';
import 'log/UI.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selected = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Authentication",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TabbarWidget(
                    index: 2,
                    selected: selected,
                    title: 'Sign up',
                    onTap: () {
                      setState(() {
                        selected = 2;
                      });
                    },
                  ),

                  TabbarWidget(
                    index: 1,
                    selected: selected,
                    title: 'Sign in',
                    onTap: () {
                      setState(() {
                        selected = 1;
                      });
                    },
                  ),
                ],
              ),
              selected == 1 ? LoginPage() : RegPage(),
            ],
          ),
        ),
      ),
    );
  }
}
