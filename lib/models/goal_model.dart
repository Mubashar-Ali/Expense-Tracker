import 'package:flutter/material.dart';

class GoalModel {
  String title;

  double savedAmount;
  double totalAmount;
  String colorHex; // Store color as hex string
  String emoji; // Store emoji as string

  GoalModel({
    required this.title,
    required this.savedAmount,
    required this.totalAmount,
    required this.colorHex,
    required this.emoji,
  });

  // Method to calculate progress
  double get progress => savedAmount / totalAmount;

  // Convert to JSON for Firestore
  Map<String, dynamic> toJson() => {
        "title": title,
        "savedAmount": savedAmount,
        "totalAmount": totalAmount,
        "color": colorHex, // Store color as hex string
        "emoji": emoji, // Store emoji as string
      };

  // Factory to create Goal from JSON
  factory GoalModel.fromJson(Map<String, dynamic> json) => GoalModel(
        title: json['title'],
        savedAmount: json['savedAmount'],
        totalAmount: json['totalAmount'],
        colorHex: json['color'],
        emoji: json['emoji'],
      );

  // Convert color from hex string to Color object
  Color get color => Color(int.parse(colorHex, radix: 16)).withOpacity(1.0);
}
