import 'package:flutter/material.dart';
import 'package:saviour/screens/home.dart';

import 'package:saviour/screens/onboarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saviour',
      // home: BottomNavBar(),

      // home: OnboardingScreen(),// suru dekhi ho yo
      home: Home(),
    );
  }
}
