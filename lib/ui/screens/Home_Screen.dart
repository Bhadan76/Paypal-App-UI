import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/bank_account.dart';
import 'package:paypal_ui_app/ui/screens/my_card_screen.dart';
import 'package:paypal_ui_app/ui/screens/transfer_screen.dart';
import 'package:paypal_ui_app/ui/widget/grid_option_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home';


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.maxFinite,
                padding: const EdgeInsets.all(25),
                color: Colors.deepPurple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Active Total Balance",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "\$ 8,420.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('ADD +'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Operations',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: 15, // Reduced spacing
                    mainAxisSpacing: 15, // Reduced spacing
                    childAspectRatio: 0.85,
                    children: [
                      grid_option_widget(icon: Icons.transfer_within_a_station, text: 'Transfer', onTap: _onTapSendMoneyScreen,),
                      grid_option_widget(icon: Icons.add_card, text: 'My card', onTap: _onTapCardScreen,),
                      grid_option_widget(icon: Icons.phone_android, text: 'Top-up', onTap: () {},),
                      grid_option_widget(icon: Icons.receipt_long, text: 'Bills', onTap: () {},),
                      grid_option_widget(icon: Icons.account_balance, text: 'Bank', onTap: _onTapBankAccountScreen,),
                      grid_option_widget(icon: Icons.more_horiz, text: 'More', onTap: () {},),
                    ],
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Monthly Spending Limit',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 15),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey.shade200,
                          color: Colors.deepPurple,
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('\$5,894.00 spent', style: TextStyle(color: Colors.grey)),
                          Text('\$8,000.00 limit', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapCardScreen(){
    Navigator.pushNamed(context, MyCard.name);
  }
  void _onTapBankAccountScreen(){
    Navigator.pushNamed(context, BankAccount.name);
  }
  void _onTapSendMoneyScreen(){
    Navigator.pushNamed(context, TransferScreen.name);
  }


}

