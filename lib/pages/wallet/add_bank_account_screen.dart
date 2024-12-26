import 'package:flutter/material.dart';

class LinkBankAccountScreen extends StatelessWidget {
  const LinkBankAccountScreen({super.key});
  static const routeName = "Link_Bank_Account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Link bank account',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search banks',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select your bank',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 220,
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 2.3,
                ),
                children: const [
                  BankTile(bankName: 'Bank of America'),
                  BankTile(bankName: 'US Bank'),
                  BankTile(bankName: 'Citi Bank'),
                  BankTile(bankName: 'Citizens Bank'),
                  BankTile(bankName: 'Chase Bank'),
                  BankTile(bankName: 'PNC Bank'),
                  SizedBox(height: 10),
                ],
              ),
            ),
            const Text(
              'All Banks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const BankTile(bankName: 'Ally Financials'),
            const BankTile(bankName: 'Fifth Third Bancorp'),
            const BankTile(bankName: 'Goldman Sachs'),
            const BankTile(bankName: 'Huntington Bancshares'),
          ],
        ),
      ),
    );
  }
}

class BankTile extends StatelessWidget {
  final String bankName;

  const BankTile({super.key, required this.bankName});

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
              child: const Icon(Icons.account_balance, color: Colors.blue)),
          title: Text(bankName),
          onTap: () {
            // Add logic for selecting the bank
          },
        ),
      ),
    );
  }
}
