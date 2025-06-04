import 'package:flutter/material.dart';
import 'screane/homePage.dart';
import 'package:projet_syn/screen/splash/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnboardingScreen(),
    );
  }
}
