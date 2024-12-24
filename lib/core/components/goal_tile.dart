import 'package:flutter/material.dart';

class GoalTile extends StatelessWidget {
  const GoalTile({super.key});

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
            color: Colors.blue.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.local_play_rounded,
          ),
        ),
        title: LinearProgressIndicator(
          borderRadius: BorderRadius.circular(12),
          value: 0.7,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.grey[200],
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
