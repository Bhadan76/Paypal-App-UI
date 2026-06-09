
import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/widget/button_widget.dart';
class MyCard extends StatefulWidget {
  const MyCard({super.key});
  static const String name='/my card screen';

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My card',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Image.asset('asset/Money card.webp',),
            SizedBox(height: 40,),
            Text('Add New Card',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Card number'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'code'
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'pin'
              ),
            ),
            SizedBox(height: 30,),
            Button_widget(onPressed: () {}, buttontext: 'Add Card',color: Colors.deepPurple,),
          ],
        ),
      ),
    );
  }
}
