import 'package:expanse_tracker/core/components/goal_tile.dart';
import 'package:expanse_tracker/pages/home/add_goal.dart';
import 'package:flutter/material.dart';

class AllGoals extends StatelessWidget {
  const AllGoals({super.key});
  static const routeName = "All_Goals";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goals"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddGoal.routeName);
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GoalsList(),
      ),
    );
  }
}
