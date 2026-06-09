import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/main_navbar_holder_screen.dart';
import 'package:paypal_ui_app/ui/screens/Registration_page.dart';
import 'package:paypal_ui_app/ui/widget/button_widget.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              // Centering the Logo
              Center(
                child: Image.asset(
                  'asset/PayPal.svg.png',
                  height: 70,
                ),
              ),
              const SizedBox(height: 80),
          Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Sign in\nto Account',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60,),
             Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                hintText: 'Email or Mobile number',

                ),
              ),
             ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                ),
              ),
              ),
              const SizedBox(height: 120,),

              Button_widget(
                onPressed: _onTapHomePage,
                buttontext: 'Sign in',color: Colors.deepPurple,),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text('Format password    |',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  TextButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegistrationPage()));
                  }, child: Text('Create Account',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
 void _onTapHomePage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MainNavbarHolderScreen()));
 }

}


