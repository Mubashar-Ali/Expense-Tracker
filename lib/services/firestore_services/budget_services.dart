import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expanse_tracker/models/budget_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BudgetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  // Add a new budget
  Future<void> addBudget(BudgetModel budget) async {
    try {
      await _firestore
          .collection('users') // Users collection
          .doc(user.currentUser!.uid) // Specific user document
          .collection('budgets') // Budgets sub-collection
          .add(budget.toJson()); // Add budget data
      log('Budget added successfully!');
    } catch (e) {
      log('Failed to add budget: $e');
    }
  }

  // Get all budgets for the current user
  Stream<List<BudgetModel>> getBudgets() {
    return _firestore
        .collection('users')
        .doc(user.currentUser!.uid)
        .collection('budgets')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => BudgetModel.fromJson(doc.data()))
          .toList();
    });
  }

  // Update an existing budget
  Future<void> updateBudget(String id, BudgetModel budget) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.currentUser!.uid)
          .collection('budgets')
          .doc(id)
          .update(budget.toJson());
      log('Budget updated successfully!');
    } catch (e) {
      log('Failed to update budget: $e');
    }
  }

  // Delete a budget
  Future<void> deleteBudget(String id) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.currentUser!.uid)
          .collection('budgets')
          .doc(id)
          .delete();
      log('Budget deleted successfully!');
    } catch (e) {
      log('Failed to delete budget: $e');
    }
  }
}
