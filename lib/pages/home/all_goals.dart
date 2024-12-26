import 'package:expanse_tracker/core/components/goal_tile.dart';
import 'package:expanse_tracker/pages/home/add_goal.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Text(
            "My Goals",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          const GoalTile(
            color: Colors.blue,
            icon: Icons.local_play,
            title: "Play Station",
          ),
          SizedBox(height: 10),
          const GoalTile(
            color: Colors.green,
            icon: Icons.phone_android,
            title: "Iphone",
          ),
          SizedBox(height: 10),
          const GoalTile(
            color: Colors.orange,
            icon: Icons.car_rental,
            title: "Fortuner",
          ),
          SizedBox(height: 10),
          const GoalTile(
            color: Colors.deepPurple,
            icon: Icons.directions_bike,
            title: "Bike",
          ),
          SizedBox(height: 10),
          const GoalTile(
            color: Colors.blueGrey,
            icon: Iconsax.book,
            title: "Education",
          ),
        ],
      ),
    );
  }
}
