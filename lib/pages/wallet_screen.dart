import 'package:expanse_tracker/core/components/wallet_card.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Total Balance Section
          Container(
            height: 230,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Color(0xff1058ed),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$223,876',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Balance',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          // My Wallets Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Wallets',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WalletCard(
                  walletName: 'Cash Wallet',
                  balance: '\$5,555',
                  icon: Icons.wallet,
                ),
                WalletCard(
                  walletName: 'Goldman Sachs',
                  balance: '\$218,321',
                  icon: Icons.account_balance,
                ),
                WalletCard(
                  walletName: 'Chase Bank',
                  balance: '\$2,110',
                  icon: Icons.account_balance_wallet,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.add_circle),
          onPressed: () {},
          style: ElevatedButton.styleFrom(),
          label: const Text(
            'Link bank account',
          ),
        ),
      ),
    );
  }
}
