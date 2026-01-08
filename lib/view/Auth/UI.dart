import 'package:flutter/material.dart';
import 'package:studio_projects/view/Auth/reg/RegSc.dart';

import '../../widgets/tabbar.dart';
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
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          onTap: () {},
          child: Image(image: AssetImage("assets/images/arrowback.png")),
        ),
        title: Image(image: AssetImage("assets/images/barimage.jpg")),
      ),

      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
