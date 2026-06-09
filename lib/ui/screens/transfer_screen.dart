import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/send_money_keypad_screen.dart';
import 'package:paypal_ui_app/ui/widget/row_transfer_botton_widget.dart';
import 'package:paypal_ui_app/ui/widget/send_button_widget.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  static const String name = '/transfer';

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Where\n to Send',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search name or email',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 25),
              SendButtonWidget(
                text: 'Wallet to Other',
                subText: 'Transfer to another wallet',
                icon: Icons.leaderboard,
                color: Colors.deepPurple,
                onTap: () => _navigateToAmountEntry('Wallet Transfer'),
              ),
              const SizedBox(height: 15),
              SendButtonWidget(
                text: 'Bank Transfer',
                subText: 'Transfer to your bank account',
                icon: Icons.account_balance,
                color: Colors.blueAccent,
                onTap: () => _navigateToAmountEntry('Bank Transfer'),
              ),
              const SizedBox(height: 30),
              const Text(
                'Recent Transactions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RowTransferButtonWidget(
                      text: 'AB Bank',
                      subText: '***7597878',
                      icon: Icons.wallet,
                      color: Colors.deepPurple,
                      onTap: () => _navigateToAmountEntry('AB Bank'),
                    ),
                    const SizedBox(width: 15),
                    RowTransferButtonWidget(
                      text: 'Samantha',
                      subText: '***1234567',
                      icon: Icons.person,
                      color: const Color(0xFF003087),
                      onTap: () => _navigateToAmountEntry('Samantha'),
                    ),
                    const SizedBox(width: 15),
                    RowTransferButtonWidget(
                      text: 'John Doe',
                      subText: '***9876543',
                      icon: Icons.person_outline,
                      color: const Color(0xFF009CDE),
                      onTap: () => _navigateToAmountEntry('John Doe'),
                    ),
                    const SizedBox(width: 15),
                    RowTransferButtonWidget(
                      text: 'Jane Smith',
                      subText: '***1122334',
                      icon: Icons.person_add_alt_1,
                      color: Colors.deepPurple,
                      onTap: () => _navigateToAmountEntry('Jane Smith'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAmountEntry(String receiverName) {
    Navigator.pushNamed(context, SendMoneyKeypadScreen.name, arguments: receiverName);
  }
}
