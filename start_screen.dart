import 'package:flutter/material.dart';
import 'package:note3/home_screen.dart';


import 'components.dart';

Color mainColor = Color(0xFF2400C5);

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 243, 252),
      body: Column(
        children: [
          const Spacer(flex: 3),
          const Icon(
            Icons.circle_notifications,
            size: 160,
            color: Color(0xFF0300AC),
          ),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.all(60),
            child: DefaultButton(
              text: 'Get Started',
              color: const Color(0xFF00027C),
              onPressedFunction: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
