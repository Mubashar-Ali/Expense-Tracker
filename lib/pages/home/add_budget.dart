import 'package:expanse_tracker/models/budget_model.dart';
import 'package:expanse_tracker/services/firestore_services/budget_services.dart';
import 'package:flutter/material.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key});
  static const routeName = "Add_Budget";

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class _AddBudgetState extends State<AddBudget> {
  String budget = 'Budget Name';
  String date = 'Period';
  bool isBudgetoverspent = false;
  bool is75 = false;
  String category = 'Select Category';

  List categories = [
    {'name': 'Clothes', 'image': 'assets/icons/clothes.png'},
    {'name': 'Food', 'image': 'assets/icons/food.png'},
    {'name': 'Gym', 'image': 'assets/icons/gym.png'},
    {'name': 'Loan', 'image': 'assets/icons/loan.png'},
    {'name': 'Pet', 'image': 'assets/icons/pet.png'},
    {'name': 'Shopping', 'image': 'assets/icons/shopping.png'},
    {'name': 'Travel', 'image': 'assets/icons/travel.png'},
  ];

  void shoppingBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: categories
                .map(
                  (item) => GestureDetector(
                    onTap: () {
                      category = item['name'];
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(item['image']),
                        ),
                        Text(item['name']),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Future<void> _selectDateTime() async {
    // Step 1: Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Step 2: Show Time Picker
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine Date and Time
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          // Format to show "Today, 10:34"
          date = _formatDateTime(combinedDateTime);
        });
      }
    }
  }

  String _formatDateTime(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final bool isToday = dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year;

    final String time =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    if (isToday) {
      return "Today, $time";
    } else {
      final String formattedDate =
          "${dateTime.day}-${dateTime.month}-${dateTime.year}";
      return "$formattedDate, $time";
    }
  }

  void navigateBudgetNamePage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BudgetNameScreen()),
    );
    if (result != null && result is String) {
      setState(() {
        budget = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Transaction'),
        actions: [
          TextButton(
            child: Text("Save"),
            onPressed: () async {
              if (budget == 'Budget Name' || category == 'Select Category') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Please fill in all required fields!')),
                );
                return;
              }

              final double amount = 1000.0; // Replace with user-entered amount
              final BudgetModel newBudget = BudgetModel(
                name: budget,
                category: category,
                period: date,
                overspent: isBudgetoverspent,
                seventyFivePercentExceeded: is75,
                amount: amount,
              );

              final BudgetService budgetService = BudgetService();
              await budgetService.addBudget(newBudget);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Budget added successfully!')),
              );

              Navigator.pop(context); // Close the screen
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1.0),
                ),

                prefixText: "Amount",
                prefixStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                // border: OutlineInputBorder(
                //   borderSide: BorderSide(),
                // ),
              ),
            ),
          ),
          ListTile(
            title: Text(budget),
            leading: const Icon(Icons.wallet),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            onTap: navigateBudgetNamePage,
          ),
          ListTile(
            title: Text(category),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.category),
            onTap: shoppingBottomSheet,
          ),
          ListTile(
            title: Text(date),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.calendar_today),
            onTap: _selectDateTime,
          ),
          Divider(),
          StatefulBuilder(
            builder: (BuildContext context, myState) {
              return ListTile(
                leading: Icon(Icons.refresh),
                title: Text('Budget overspent'),
                trailing: Switch(
                  value: isBudgetoverspent,
                  onChanged: (value) {
                    isBudgetoverspent = value;
                    myState(() {});
                  },
                ),
              );
            },
          ),
          StatefulBuilder(
            builder: (BuildContext context, myState) {
              return ListTile(
                leading: Icon(Icons.refresh),
                title: Text('75% of budget exceeded'),
                trailing: Switch(
                  value: isBudgetoverspent,
                  onChanged: (value) {
                    is75 = value;
                    myState(() {});
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class BudgetNameScreen extends StatefulWidget {
  const BudgetNameScreen({super.key});

  @override
  State<BudgetNameScreen> createState() => _BudgetNameScreenState();
}

class _BudgetNameScreenState extends State<BudgetNameScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Name'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
            child: Text('Save'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Budget name',
          ),
        ),
      ),
    );
  }
}
