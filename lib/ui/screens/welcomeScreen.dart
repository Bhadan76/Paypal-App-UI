import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/Home_Screen.dart';
import 'package:paypal_ui_app/ui/screens/Registration_page.dart';

import 'signin_page.dart';
import '../widget/button_widget.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});
  static const String name='/welcome Screen';

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                'asset/paypal_background.jpg', // Path moved to the front
                fit: BoxFit.cover,
              ),
            ),
          ),
         SafeArea(
             child: SizedBox(
               width: double.infinity,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   const SizedBox(height: 100,),
                   Image.asset('asset/PayPal.svg.png', height: 60,),
                   const SizedBox(height: 220,),
                   const Text(
                     'Fast & Secure',
                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                   ),
                   const Text(
                     'The safer and easier\nway to pay with paypal',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                       fontSize: 25,
                       fontWeight: FontWeight.w500,
                       color: Color(0xFF0F9CD8), // Fixed color code syntax
                     ),
                   ),
                   const SizedBox(height: 110,),
                   Button_widget(onPressed: _onTapSigninPageScreen, buttontext: 'login',color: Colors.deepPurple,),
                   TextButton(
                       onPressed: _onTapRegistationPage,
                       child: Text('Create a new account',style: TextStyle(
                           fontSize: 20,
                       ),
                       )),
                 ],
               ),
             ),

         ),

        ]
      ),

    );
  }
  void _onTapSigninPageScreen(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SigninPage()));
  }
  void _onTapRegistationPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));

  }
}




