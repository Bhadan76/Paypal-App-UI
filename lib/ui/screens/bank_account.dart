import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/widget/bank_card_widget.dart';
class BankAccount extends StatefulWidget {
  const BankAccount({super.key});
  static const String name='/bank Account';

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.manage_accounts),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('User New Account',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Bank account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(height: 20,),
              bank_card_widget(accountName: 'City Bank', accountNumber: '758***09384', availableBalance: '\$44,058.00', isActive: true, onChanged: (_) {  },),
              bank_card_widget(accountName: 'Jomuna Bank', accountNumber: '758***09384', availableBalance: '\$44,058.00', isActive: true, onChanged: (_) {  },),
              bank_card_widget(accountName: 'AB Bank', accountNumber: '758***09384', availableBalance: '\$27,058.00', isActive: true, onChanged: (_) {  },),
              bank_card_widget(accountName: 'IFIC Bank', accountNumber: '758***09384', availableBalance: '\$44,058.00', isActive: true, onChanged: (_) {  },),
            ],
          ),
        ),
      ),
    );
  }
}


