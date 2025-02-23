import 'package:expanse_tracker/services/firestore_services/budget_services.dart';
import 'package:flutter/material.dart';
import 'package:expanse_tracker/models/budget_model.dart';

class BudgetListScreen extends StatefulWidget {
  const BudgetListScreen({super.key});

  @override
  State<BudgetListScreen> createState() => _BudgetListScreenState();
}

class _BudgetListScreenState extends State<BudgetListScreen> {
  final BudgetService _budgetService = BudgetService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BudgetModel>>(
      stream: _budgetService.getBudgets(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text("An error occurred: ${snapshot.error}"),
          );
        }

        final budgets = snapshot.data;

        if (budgets == null || budgets.isEmpty) {
          return const Center(
            child: Text(
              "No budgets added yet.",
              style: TextStyle(fontSize: 16),
            ),
          );
        }

        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: budgets.length,
          itemBuilder: (context, index) {
            final budget = budgets[index];
            return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.category),
              ),
              title: Text(
                budget.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${budget.category} • ${budget.period}",
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${budget.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: budget.overspent ? Colors.red : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (budget.seventyFivePercentExceeded)
                    Text(
                      "75% Exceeded",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange,
                      ),
                    ),
                ],
              ),
              onTap: () {
                _showBudgetDetails(context, budget);
              },
            );
          },
        );
      },
    );
  }

  void _showBudgetDetails(BuildContext context, BudgetModel budget) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(budget.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category: ${budget.category}"),
              Text("Period: ${budget.period}"),
              Text("Amount: \$${budget.amount.toStringAsFixed(2)}"),
              Text("Overspent: ${budget.overspent ? "Yes" : "No"}"),
              Text(
                "75% Exceeded: ${budget.seventyFivePercentExceeded ? "Yes" : "No"}",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
