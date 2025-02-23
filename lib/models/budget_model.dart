class BudgetModel {
  final String name;
  final String category;
  final String period;
  final bool overspent;
  final bool seventyFivePercentExceeded;
  final double amount;

  BudgetModel({
    required this.name,
    required this.category,
    required this.period,
    required this.overspent,
    required this.seventyFivePercentExceeded,
    required this.amount,
  });

  // Convert BudgetModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'period': period,
      'overspent': overspent,
      'seventyFivePercentExceeded': seventyFivePercentExceeded,
      'amount': amount,
    };
  }

  // Create a BudgetModel from Firestore data
  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      name: json['name'],
      category: json['category'],
      period: json['period'],
      overspent: json['overspent'],
      seventyFivePercentExceeded: json['seventyFivePercentExceeded'],
      amount: json['amount'],
    );
  }
}
