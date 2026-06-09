
import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/OnboardingScreen.dart';
import 'package:paypal_ui_app/ui/screens/welcomeScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  static const String name='/';


  @override
  State<Splashscreen> createState() => _SplashscreenState();


}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    _durationScreen();
  }
Future<void> _durationScreen () async {
  await Future.delayed(Duration(seconds: 3));
  Navigator.pushReplacementNamed(context, Onboardingscreen.name);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
                opacity: 0.25,
                child: Image.asset(
                  height: double.infinity,
                  width: double.infinity,
                    fit: BoxFit.cover,
                    'asset/paypal_background.jpg',

                ),
            ),

          ),
          Center(
            child: Image.asset(

                'asset/Logo.png'),
          ),
        ],
      ),
    );
  }
}
