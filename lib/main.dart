import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/Home_Screen.dart';
import 'package:paypal_ui_app/ui/screens/OnboardingScreen.dart';
import 'package:paypal_ui_app/ui/screens/my_card_screen.dart';
import 'package:paypal_ui_app/ui/screens/payment_summary_screen.dart';
import 'package:paypal_ui_app/ui/screens/payment_success_screen.dart';
import 'package:paypal_ui_app/ui/screens/send_money_keypad_screen.dart';
import 'package:paypal_ui_app/ui/screens/transfer_screen.dart';
import 'package:paypal_ui_app/ui/screens/welcomeScreen.dart';

import 'ui/screens/bank_account.dart';
import 'ui/screens/SplashScreen.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white54,
              contentPadding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Colors.blue.shade100,
                      width: 1.5
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color(0xFF009CDE),
                      width: 2
                  )
              )


          ),
        ),
      
      title: 'Paypal App',
      debugShowCheckedModeBanner: false,
      initialRoute: Splashscreen.name,
      routes: {
        Splashscreen.name :(_)=> const Splashscreen(),
        Onboardingscreen.name :(_)=> const Onboardingscreen(),
        welcomeScreen.name : (_)=> const welcomeScreen(),
        HomeScreen.name : (_)=> const HomeScreen(),
        MyCard.name : (_)=> const MyCard(),
        BankAccount.name : (_)=> const BankAccount(),
        TransferScreen.name : (_)=> TransferScreen(),
        SendMoneyKeypadScreen.name : (_)=> const SendMoneyKeypadScreen(),
        PaymentSummaryScreen.name : (_)=> const PaymentSummaryScreen(),
        PaymentSuccessScreen.name : (_)=> const PaymentSuccessScreen(),

      },

    );
  }
}
