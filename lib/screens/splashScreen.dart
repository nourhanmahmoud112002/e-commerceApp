import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assests/images/ecommerce-1.png'),
      logoWidth: 150,
      title: const Text(
        'Online Shopping',
        style: TextStyle(
          fontSize: 24,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
      backgroundColor: kprimaryColor,
      navigator: LoginPage(),
      durationInSeconds: 5,
      loaderColor: Colors.white,
    );
    // return AnimatedSplashScreen(
    //   // curve: Curves.easeInCirc,
    //   splash: 'assests/images/splash.png',
    //   nextScreen: LoginPage(),
    //   // splashTransition: SplashTransition.scaleTransition,
    //   backgroundColor: Color(0xff6C63FF),
    // );
  }
}
