import 'package:expanse_tracker/pages/home/add_transaction.dart';
import 'package:expanse_tracker/pages/stat/stats_screen.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  static const routeName = "Transaction_Screen";
  final List<Map<String, dynamic>> transactions = [
    {
      "category": "Entertainment",
      "amount": -120,
      "time": "10:00 AM",
      "icon": Icons.movie
    },
    {
      "category": "Shopping",
      "amount": -80,
      "time": "09:00 PM",
      "icon": Icons.shopping_bag
    },
    {
      "category": "Food",
      "amount": -50,
      "time": "07:30 PM",
      "icon": Icons.restaurant
    },
    {"category": "Pets", "amount": -80, "time": "10:30 AM", "icon": Icons.pets},
    {
      "category": "Entertainment",
      "amount": -20,
      "time": "11:30 PM",
      "icon": Icons.movie
    },
  ];

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Total Transactions",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddTransactionScreen.routeName);
              },
              icon: Icon(Icons.add_circle))
        ],
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: SfDateRangePicker(
          //     selectionMode: DateRangePickerSelectionMode.single,
          //     initialSelectedDate: DateTime.now(),
          //     headerStyle: const DateRangePickerHeaderStyle(
          //       textStyle: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //     todayHighlightColor: Colors.blue,
          //     selectionColor: Colors.blue,
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionItem(
                  icon: transaction["icon"],
                  title: transaction["category"],
                  subtitle:
                      "Transaction details here", // You can add dynamic subtitle
                  amount: "\$${transaction["amount"]}",
                  time: transaction["time"],
                  color: transaction["amount"] < 0 ? Colors.red : Colors.green,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
