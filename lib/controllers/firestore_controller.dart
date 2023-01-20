import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  static Future<String?> getUsername() async {
    if(firebaseAuth.currentUser != null){
      QuerySnapshot querySnapshot = await firebaseFirestore.collection(firebaseAuth.currentUser!.uid).get();
      QueryDocumentSnapshot queryDocumentSnapshot = querySnapshot.docs.first;

      return queryDocumentSnapshot['username'];
    }

    return null;
  }
}