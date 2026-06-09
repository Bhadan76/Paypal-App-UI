import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/payment_success_screen.dart';

class PaymentSummaryScreen extends StatelessWidget {
  const PaymentSummaryScreen({super.key});
  static const String name = '/payment-summary';

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context)?.settings.arguments as Map? ?? {'name': 'John Doe', 'amount': '2,420.00'};
    final String name = args['name'];
    final String amount = args['amount'];

    return Scaffold(
      backgroundColor: const Color(0xFF003087),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text('MONEY PAID', style: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 1.2)),
          const SizedBox(height: 10),
          Text('₹ $amount', style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PAID TO', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const CircleAvatar(radius: 25, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white)),
                      const SizedBox(width: 15),
                      Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text('TO', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.account_balance, color: Colors.blue, size: 30),
                    title: Text('Paypal Balance', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Default spending method'),
                  ),
                  const Divider(height: 40),
                  _buildDetailRow('Transaction No.', '6738495067'),
                  _buildDetailRow('Date', 'June 12, 2023'),
                  _buildDetailRow('Status', 'Completed', color: Colors.green),
                  const Spacer(),
                  SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, PaymentSuccessScreen.name, (predicate) => false);

                        // Navigator.pushNamed(context, PaymentSuccessScreen.name, arguments: amount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003087),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('Confirm & Pay', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, color: color ?? Colors.black)),
        ],
      ),
    );
  }
}
