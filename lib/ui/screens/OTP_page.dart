import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/widget/button_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'signin_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Text(
                'OTP\nVerify!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Enter 4-digit code',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Row(
                children: [
                  Text(
                    '+88 013*********',
                    style: TextStyle(color: Color(0xFF0F9CD8)),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.pending_outlined,
                      color: Color(0xFF0F9CD8),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialPinField(
                    length: 4,

                    onCompleted: (pin) => print('PIN: $pin'),
                    onChanged: (value) => print('Changed: $value'),
                    theme: MaterialPinTheme(
                      spacing: 20,
                      shape: MaterialPinShape.outlined,
                      cellSize: Size(70, 64),
                      borderRadius: BorderRadius.circular(12),
                      fillColor: Colors.blue.shade100,
                      borderColor: Colors.blue.shade300,
                      focusedFillColor: Colors.blue.shade100,
                      textStyle: TextStyle(color: Colors.black, fontSize: 30),
                      filledBorderColor: Colors.blue.shade300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'The code will be process 60 secounds',
                style: TextTheme.of(context).titleSmall,
              ),
              SizedBox(height: 120),
              Button_widget(
                onPressed: _onTapLoginScreen,
                buttontext: 'Continue',
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapLoginScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SigninPage()),
      (predicate) => false,
    );
  }
}
