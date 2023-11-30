import 'package:flutter/material.dart';
import 'package:to_do_app/modules/AddTaskScreen.dart';
import 'package:to_do_app/modules/homePage.dart';
import 'package:to_do_app/modules/onBordingScreen/onBoardingScreen.dart';
import 'package:to_do_app/modules/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}