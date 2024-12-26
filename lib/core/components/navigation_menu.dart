import 'package:expanse_tracker/core/constants/colors.dart';
import 'package:expanse_tracker/pages/home/home_screen.dart';
import 'package:expanse_tracker/pages/profile/profile_screen.dart';
import 'package:expanse_tracker/pages/stat/stats_screen.dart';
import 'package:expanse_tracker/pages/wallet/wallet_screen.dart';
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
    const StatisticsScreen(),
    const WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 2),
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.white,
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
              color: MyColors.primary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.bar_chart_outlined),
            label: "Statistics",
            selectedIcon: Icon(
              Icons.bar_chart_sharp,
              color: MyColors.primary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.wallet),
            label: "Wallet",
            selectedIcon: Icon(
              Iconsax.wallet,
              color: MyColors.primary,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Iconsax.profile_circle),
            label: "Profile",
            selectedIcon: Icon(
              Iconsax.profile_circle5,
              color: MyColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
