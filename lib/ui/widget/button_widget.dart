
import 'package:flutter/material.dart';

class Button_widget extends StatelessWidget {
  final String buttontext;
  final Color? color;
  final VoidCallback onPressed;
  const Button_widget({
    super.key, this.color, required this.onPressed, required this.buttontext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: double.maxFinite,
        height: 60, // Fixed height for a bigger button
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
            ),
            onPressed: onPressed,
            child: Text(
              buttontext,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),

      ),

    );
  }
}