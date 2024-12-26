import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _googleSignIn = GoogleSignIn();

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // get current username
  String? getCurrentUsername() {
    if (_auth.currentUser != null) {
      return _auth.currentUser?.displayName;
    }
    return null;
  }

  // sign in
  signIn(String email, String password, BuildContext context) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      log('Signed in successfully!');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // throw Exception(e.code);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("$e"),
          );
        },
      );
    }
  }

  // signInWithGoogle(BuildContext context) async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) return null;

  //     final googleAuth = await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Sign in to firebase with google credentials
  //     final userCredential = await _auth.signInWithCredential(credential);
  //     log('Google sign in successful!');
  //     return userCredential;
  //   } catch (e) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("Error"),
  //           content: Text("$e"),
  //         );
  //       },
  //     );
  //   }
  // }

  // sign up
  signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      log('Signed up successfully!');

      // save user info in a separate doc
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          "uid": userCredential.user!.uid,
          "name": name,
          "email": email,
          "password": password,
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // throw Exception(e.code);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("$e"),
          );
        },
      );
    }
  }

  // sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // Sign out from Google
  Future<void> signOutGoogle() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
