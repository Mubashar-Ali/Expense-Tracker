import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expanse_tracker/core/utils/loading_screen.dart';
import 'package:expanse_tracker/services/firestore_services/goals_services.dart';
import 'package:flutter/material.dart';
import 'package:expanse_tracker/models/goal_model.dart';

class GoalTile extends StatelessWidget {
  final QueryDocumentSnapshot doc;

  const GoalTile({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    final map = doc.data() as Map<String, dynamic>;
    final goal = GoalModel.fromJson(map);
    // Convert hex color string to Color object
    final Color goalColor = goal.color;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text("Are you sure, you want to delete the goal"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                TextButton(
                    onPressed: () {
                      GoalService().deleteGoal(doc.id);
                      Navigator.pop(context);
                    },
                    child: Text("Delete")),
              ],
            ),
          );
        },
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color:
                goalColor.withOpacity(0.3), // Use the goal color with opacity
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              goal.emoji, // Display the emoji directly from the model
              style: TextStyle(
                fontSize: 24, // You can adjust the size of the emoji here
                color: goalColor, // Set the color of the emoji icon
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goal.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: goal.progress,
              valueColor: AlwaysStoppedAnimation<Color>(goalColor),
              backgroundColor: Colors.grey[200],
            ),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Saved \$${goal.savedAmount.toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 12,
              ),
            ),
            Text(
              "Left \$${(goal.totalAmount - goal.savedAmount).toStringAsFixed(2)}",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalsList extends StatelessWidget {
  final GoalService _goalService = GoalService();

  GoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _goalService.getGoals(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingScreen());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No Goals found."));
        }

        final goals = snapshot.data!;
        // final docs = snapshot.data!.docs;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: goals.docs.length,
          itemBuilder: (context, index) {
            final goal = goals.docs[index];
            return GoalTile(doc: goal);
          },
        );
      },
    );
  }
}
