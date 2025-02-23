import 'package:expanse_tracker/models/goal_model.dart';
import 'package:expanse_tracker/services/firestore_services/goals_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class AddGoal extends StatefulWidget {
  const AddGoal({super.key});

  static const routeName = "Add_Goal";

  @override
  State<AddGoal> createState() => _AddGoalState();
}

class _AddGoalState extends State<AddGoal> {
  final TextEditingController _amountController = TextEditingController();
  final GoalService _goalService = GoalService();

  String date = 'Target Date';
  String goalName = 'Goal Name';
  String goalDescription = 'Goal Description';
  Color selectedColor = Colors.blue;
  String selectedEmoji = "⭐";

  Future<void> _selectDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        date = "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      });
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

  Future<void> _pickColor() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Pick a Color"),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickEmoji() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 700,
          child: EmojiPicker(
            onEmojiSelected: (category, emoji) {
              setState(() {
                selectedEmoji = emoji.emoji;
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }

  Future<void> _saveGoal() async {
    if (goalName == 'Goal Name' ||
        goalDescription == 'Goal Description' ||
        _amountController.text.isEmpty ||
        date == 'Target Date') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    final double amount = double.tryParse(_amountController.text) ?? 0.0;

    // Get current user
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User not logged in")),
      );
      return;
    }

    final goal = GoalModel(
      title: goalName,
      savedAmount: 0.0,
      totalAmount: amount,
      colorHex: selectedColor.value
          .toRadixString(16)
          .padLeft(8, '0'), // Convert Color to hex
      emoji: selectedEmoji,
    );

    await _goalService.addGoal(goal);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Goal added successfully!")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Goal'),
          actions: [
            TextButton(
              onPressed: _saveGoal,
              child: const Text("Save"),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _amountController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.0),
                  ),
                  prefixText: "Amount",
                  prefixStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            ListTile(
              title: Text(date),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              leading: const Icon(Icons.calendar_today),
              onTap: _selectDateTime,
            ),
            ListTile(
              title: Text(goalName),
              leading: const Icon(Icons.account_balance),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: () => navigateGoalPage('Goal Name'),
            ),
            ListTile(
              title: Text(goalDescription),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              leading: const Icon(Icons.category),
              onTap: () => navigateGoalPage('Goal Description'),
            ),
            ListTile(
              title: Text("Selected Emoji: $selectedEmoji"),
              leading: const Icon(Icons.emoji_emotions),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: _pickEmoji,
            ),
            ListTile(
              title: const Text("Pick Color"),
              leading: CircleAvatar(backgroundColor: selectedColor),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              onTap: _pickColor,
            ),
          ],
        ),
      ),
    );
  }
}

class GoalNameScreen extends StatefulWidget {
  final String page;

  const GoalNameScreen({super.key, required this.page});

  @override
  State<GoalNameScreen> createState() => _GoalNameScreenState();
}

class _GoalNameScreenState extends State<GoalNameScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit ${widget.page}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _textController.text.trim());
            },
            child: const Text("Save"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            labelText: widget.page,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
