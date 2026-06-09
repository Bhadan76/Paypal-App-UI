import 'package:flutter/material.dart';
import 'package:paypal_ui_app/ui/screens/Home_Screen.dart';
import 'package:paypal_ui_app/ui/screens/my_card_screen.dart';
import 'package:paypal_ui_app/ui/screens/transfer_screen.dart';
import 'package:paypal_ui_app/ui/screens/bank_account.dart';

class MainNavbarHolderScreen extends StatefulWidget {
  const MainNavbarHolderScreen({super.key});
  static const String name = '/main-navbar';

  @override
  State<MainNavbarHolderScreen> createState() => _MainNavbarHolderScreenState();
}

class _MainNavbarHolderScreenState extends State<MainNavbarHolderScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF003087)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Color(0xFF003087)),
              ),
              accountName: const Text(
                'User Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: const Text('user@email.com'),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF003087)),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Color(0xFF003087),
              ),
              title: const Text('Wallet'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Color(0xFF003087)),
              title: const Text('Activity'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.notifications_outlined),
              selectedIcon: Icon(Icons.notifications),
              label: 'Alerts'),
          NavigationDestination(
              icon: Icon(Icons.wallet_outlined),
              selectedIcon: Icon(Icons.wallet),
              label: 'Wallet'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'Profile'),
        ],
      ),
    );
  }
}
