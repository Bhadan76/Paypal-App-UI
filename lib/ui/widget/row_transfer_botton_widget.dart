import 'package:flutter/material.dart';

import '../screens/payment_summary_screen.dart';

class RowTransferButtonWidget extends StatefulWidget {
  const RowTransferButtonWidget({
    super.key,
    required this.text,
    required this.subText,
    required this.icon,
    required this.color, required this.onTap,
  });

  final String text;
  final String subText;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  State<RowTransferButtonWidget> createState() => _RowTransferButtonWidgetState();
}

class _RowTransferButtonWidgetState extends State<RowTransferButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 160,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white24,
            child: Icon(widget.icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 10),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.subText,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Spacer(),
          SizedBox(
            width: double.maxFinite,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: widget.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, PaymentSummaryScreen.name , (predicate)=> false);
              },
              child: Text('Send'),
            ),
          ),
        ],
      ),
    );
  }
}
