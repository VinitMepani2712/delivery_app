import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app/admin/admin_login.dart';
import 'package:delivery_app/pages/home_page.dart';
import 'package:delivery_app/pages/order_page.dart';
import 'package:delivery_app/pages/profile_page.dart';
import 'package:delivery_app/pages/wallet_page.dart';
import 'package:flutter/material.dart';

class BottemNavigationBar extends StatefulWidget {
  const BottemNavigationBar({super.key});

  @override
  State<BottemNavigationBar> createState() => _BottemNavigationBarState();
}

class _BottemNavigationBarState extends State<BottemNavigationBar> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homePage;
  late ProfilePage profile;
  late OrderPage order;
  late WalletPage wallet;
  late AdminPage admin;

  void initState() {
    homePage = HomePage();
    order = OrderPage();
    wallet = WalletPage();
    profile = ProfilePage();
    admin = AdminPage();
    pages = [
      homePage,
      order,
      wallet,
      profile,
      admin,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 150),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.admin_panel_settings_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
