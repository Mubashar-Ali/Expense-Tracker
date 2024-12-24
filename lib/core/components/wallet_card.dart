import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String walletName;
  final String balance;
  final IconData icon;

  const WalletCard(
      {super.key,
      required this.walletName,
      required this.balance,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
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
                border: Border.all(color: Colors.grey.shade400),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.blue,
              ),
            ),
            title: Text(
              walletName,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black38,
              ),
            ),
            subtitle: Text(
              balance,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )),
          ),
        ));
  }
}
