
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/Home_Screen.dart';
import 'package:paypal_ui_app/ui/screens/OTP_page.dart';
import 'package:paypal_ui_app/ui/screens/signin_page.dart';
import 'package:paypal_ui_app/ui/widget/button_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey _formKey = GlobalKey();
  TextEditingController _locationController =TextEditingController();
  TextEditingController _phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Text('Phone\nRegistration',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 60,),
                Text('Enter your location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'location'
                  ),
                ),
                SizedBox(height: 20,),
                Text('Enter your Phone number',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                  ),
                ),
                SizedBox(height: 60,),
                Button_widget(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OtpPage()));
                  },
                  buttontext: 'Continue',
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 80,),
                Center(
                  child: Text('Powered By',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'paypal.com',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                            color: Color(0xFF0F9CD8)
                        ),
                      ),
                  ),

                ),
                const Spacer(),


              ],
            ),
          ),
        ),
      ),
    );

  }
}
