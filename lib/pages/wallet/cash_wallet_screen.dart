import 'package:flutter/material.dart';

class CashWalletScreen extends StatelessWidget {
  const CashWalletScreen({super.key});
  static const routeName = "Cash_Wallet_Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Cash Wallet',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            WalletItem(
                title: 'Salary',
                amount: '\$1000',
                icon: Icons.wallet,
                iconColor: Colors.green),
            WalletItem(
                title: 'Side Hustle',
                amount: '\$3000',
                icon: Icons.payment,
                iconColor: Colors.purple),
            WalletItem(
              title: 'Extra',
              amount: '\$1555',
              icon: Icons.payments,
              iconColor: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}

class WalletItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String amount;
  final Color iconColor;

  const WalletItem({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: ListTile(
              contentPadding: EdgeInsets.zero,
              minTileHeight: 0,
              minVerticalPadding: 0,
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: iconColor.withOpacity(0.3)),
                child: Icon(
                  icon,
                  size: 20,
                  color: iconColor,
                ),
              ),
              title: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text(
                "Cash Wallet",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: Text(
                amount,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
        ));
  }
}
