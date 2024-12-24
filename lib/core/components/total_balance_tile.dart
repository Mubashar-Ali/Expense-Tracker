import 'package:flutter/material.dart';

class TotalBalanceTile extends StatelessWidget {
  const TotalBalanceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total Balance",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "\$223,456",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: TextButton(
        onPressed: () {},
        child: const Text(
          "View All",
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
