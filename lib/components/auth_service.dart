import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flylens/config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      return null;
    }
  }

  static Future<UserCredential?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Error: ${e.message}', gravity: ToastGravity.TOP, backgroundColor: AppColor.errorColor);
      return null;
    }
  }

  static Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: 'Error: ${e.message}', gravity: ToastGravity.TOP, backgroundColor: AppColor.errorColor);
      return null;
    }
  }

  static Future<bool> existDocWithId(String accountType, String id) async {
    DocumentSnapshot user = await FirebaseFirestore.instance.collection(accountType).doc(id).get();
    return user.exists;
  }

  static Future<bool> existAccountWithSocialCredential(
      {required UserCredential credential, required List<String> accountType}) async {
    if (accountType.length > 1) {
      List<Future<bool>> futures = [];
      for (var element in accountType) {
        futures.add(existDocWithId(element, credential.user!.uid));
      }
      List<bool> exist = await Future.wait(futures);
      return exist.contains(true);
    } else {
      return existDocWithId(accountType.first, credential.user!.uid);
    }
  }
}
