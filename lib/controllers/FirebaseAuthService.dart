import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService{
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static Future<void> signOut(BuildContext context) async {
    await firebaseAuth.signOut().then((value) => {
      // TODO: After sign out stuffs
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign out successfully!'))
      )
    });
  }

  static Future<String?> signIn(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        return null;
      }
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('You have signed in successfully!'))
      // );

    } on FirebaseAuthException catch (e) {
      return e.message;
    }

    return 'Opps, something went wrong';
  }

  static Future<String?> register(BuildContext context, String username, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        return null;
      }
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('Registered and logged in successfully!'))
      // );
    } on FirebaseAuthException catch (e) {
      return e.message;
    }

    return 'Opps, something went wrong';
  }
}