import 'package:expanse_tracker/pages/home_screen.dart';
import 'package:expanse_tracker/pages/stats_screen.dart';
import 'package:expanse_tracker/pages/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  static const routeName = 'Navigation_Menu';

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    // AddEditJobScreen(),
    const StatisticsScreen(),
    const WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 2),
        indicatorColor: Colors.transparent,
        // backgroundColor: dark ? Colors.black : Colors.white,
        height: 60,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Iconsax.home),
            label: "Home",
            selectedIcon: Icon(
              Iconsax.home5,
              // color: dark ? Colors.lightBlue : MyColors.secondary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            label: "Statistics",
            selectedIcon: Icon(
              Iconsax.chart,
              // color: dark ? Colors.lightBlue : MyColors.secondary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            label: "Wallet",
            selectedIcon: Icon(
              Iconsax.wallet,
              // color: dark ? Colors.lightBlue : MyColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
