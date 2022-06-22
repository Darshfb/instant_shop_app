import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../auth_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  AnimatedSplashScreen(
        //to cover the photo the phone
        splashIconSize: double.infinity,
        duration: 2000,
        splash: Image.asset(
          'assets/images/726739.png',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        nextScreen: aut_container(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
