import 'package:flutter/material.dart';

class GoalTile extends StatelessWidget {
  const GoalTile(
      {super.key,
      required this.title,
      required this.color,
      required this.icon});

  final String title;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.start,
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(12),
              value: 0.7,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              backgroundColor: Colors.grey[200],
            ),
          ],
        ),
        subtitle: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Saved \$2,000 / 60%",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
              ),
            ),
            Text(
              "Left \$2,000 / 60%",
              style: TextStyle(
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
