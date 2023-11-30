import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/onBordingScreen/onBoardingScreen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mediaQueryh = MediaQuery.of(context).size.height;
    final mediaQueryw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.black,
        duration: 3000,
        splashTransition: SplashTransition.rotationTransition,
        splash:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                //width: mediaQueryw*.1,
                width: 55,
                height: mediaQueryh*.07,
                child: Image.asset(
                  'assets/images/Group 151.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(
              'UpTodo',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ],
        ),

        // Expanded(
        //   child: Text(
        //     'Chef App',
        //     style: TextStyle(
        //       fontSize: 40,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),

        nextScreen: onBoardingScreen() ,
      ),
    );
  }
}
