import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expanse_tracker/models/goal_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance;

  // Get all goals
  Stream<QuerySnapshot> getGoals() {
    return _firestore
        .collection('users')
        .doc(user.currentUser!.uid)
        .collection("goals")
        .snapshots();
    //     .map(
    //   (snapshot) {
    //     return snapshot.docs
    //         .map((doc) => GoalModel.fromJson(doc.data()))
    //         .toList();
    //   },
    // );
  }

  // Add a new goal
  Future<void> addGoal(GoalModel goal) async {
    await _firestore
        .collection('users')
        .doc(user.currentUser!.uid)
        .collection("goals")
        .add(goal.toJson());
    // .doc(goal.id)
    // .set(goal.toJson());
  }

  // Update a goal
  Future<void> updateGoal(GoalModel goal) async {
    await _firestore
        .collection('users')
        .doc()
        .collection("goals")
        .doc()
        .update(goal.toJson());
  }

  // Delete a goal
  Future<void> deleteGoal(String id) async {
    try {
      await _firestore
          .collection('users')
          .doc(user.currentUser!.uid)
          .collection("goals")
          .doc(id)
          .delete();
      log('deleted successfully : $id');
    } catch (e) {
      log(e.toString());
    }
  }
}
