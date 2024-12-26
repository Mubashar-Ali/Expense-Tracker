import 'package:flutter/material.dart';

class AddGoal extends StatefulWidget {
  const AddGoal({super.key});

  static const routeName = "Add_Goal";

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  String date = 'Target Date';
  String goalName = 'Goal Name';
  String goalDescription = 'Goal Description';

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

  void navigateGoalPage(String name) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoalNameScreen(page: name)),
    );
    if (result != null && result is String) {
      setState(() {
        name == "Goal Name" ? goalName = result : goalDescription = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Goal'),
        actions: [
          TextButton(
            child: Text("Save"),
            onPressed: () {},
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
            title: Text(date),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.calendar_today),
            onTap: _selectDateTime,
          ),
          ListTile(
            title: Text(goalName),
            leading: const Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            onTap: () => navigateGoalPage('Goal Name'),
          ),
          ListTile(
            title: Text(goalDescription),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            leading: const Icon(Icons.category),
            onTap: () => navigateGoalPage('Goal Description'),
          ),
        ],
      ),
    );
  }
}

class GoalNameScreen extends StatefulWidget {
  const GoalNameScreen({super.key, required this.page});

  final String page;

  @override
  State<GoalNameScreen> createState() => _GoalNameScreenState();
}

class _GoalNameScreenState extends State<GoalNameScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.page),
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
            hintText: 'Enter text here',
          ),
        ),
      ),
    );
  }
}
