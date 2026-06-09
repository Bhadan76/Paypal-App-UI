import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/payment_summary_screen.dart';

class SendMoneyKeypadScreen extends StatefulWidget {
  const SendMoneyKeypadScreen({super.key});
  static const String name = '/send-money-keypad';

  @override
  State<SendMoneyKeypadScreen> createState() => _SendMoneyKeypadScreenState();
}

class _SendMoneyKeypadScreenState extends State<SendMoneyKeypadScreen> {
  String _amount = "2,420.00";

  void _onKeyTap(String value) {
    setState(() {
      if (value == "back") {
        if (_amount.isNotEmpty) _amount = _amount.substring(0, _amount.length - 1);
      } else {
        _amount += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String receiverName = ModalRoute.of(context)?.settings.arguments as String? ?? 'John Doe';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text('Send Money', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code_scanner, color: Colors.blue)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            '₹ $_amount',
            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(receiverName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('Bank of America - 2314', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          const Spacer(),
          _buildKeypad(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.maxFinite,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, PaymentSummaryScreen.name, arguments: {'name': receiverName, 'amount': _amount});
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003087),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeypad() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1.5,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _keyButton("1"), _keyButton("2"), _keyButton("3"),
          _keyButton("4"), _keyButton("5"), _keyButton("6"),
          _keyButton("7"), _keyButton("8"), _keyButton("9"),
          _keyButton("."), _keyButton("0"), _keyIconButton(Icons.backspace_outlined, "back"),
        ],
      ),
    );
  }

  Widget _keyButton(String val) {
    return TextButton(
      onPressed: () => _onKeyTap(val),
      child: Text(val, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget _keyIconButton(IconData icon, String val) {
    return IconButton(
      onPressed: () => _onKeyTap(val),
      icon: Icon(icon, color: Colors.black),
    );
  }
}
