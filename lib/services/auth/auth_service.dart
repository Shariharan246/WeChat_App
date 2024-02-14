import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in method
  Future<UserCredential> signInWithEmailandPassword(String email , String password) async{
    try{
      //signin
      UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : email,
      }, SetOptions(merge: true),
      );
      return userCredential;

    } on FirebaseAuthException catch(e) {
      throw Exception(e.code);
    }
  }
  //create new user
  Future<UserCredential> signUpWithEmailandPassword(
      String email , password) async{
    try{
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
          );
      // after crerating the user,create a new document for the user in user collection
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid,
        'email' : email,
      });

      return userCredential;
    } on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }
// sign out method
Future<void> signOut() async{
    return await FirebaseAuth.instance.signOut();
}
}