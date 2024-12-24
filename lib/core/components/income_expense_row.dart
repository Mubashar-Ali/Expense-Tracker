import 'package:expanse_tracker/core/components/income_expense_tile.dart';
import 'package:flutter/material.dart';

class IncomeExpenseRow extends StatelessWidget {
  const IncomeExpenseRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: IncomeExpenseTile(
            title: "Income",
            amount: "\$123,444",
            icon: Icons.trending_up,
            iconColor: Colors.green,
            backgroundColor: Colors.green,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: IncomeExpenseTile(
            title: "Expense",
            amount: "\$123,444",
            icon: Icons.trending_down,
            iconColor: Colors.red,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}