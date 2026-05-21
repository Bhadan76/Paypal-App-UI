
import 'package:flutter/material.dart';
import 'package:paypal_ui_app/OnboardingScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});


  @override
  State<Splashscreen> createState() => _SplashscreenState();


}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Onboardingscreen()));
      }
    });
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
              // height: 100,
              //   width: 100,
                'asset/Logo.png'),
          ),
          SizedBox(height: 10),
          Text('')
        ],
      ),

    );
  }
}
