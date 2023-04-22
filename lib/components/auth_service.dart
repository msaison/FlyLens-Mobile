import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'alert_toast.dart';
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

  static Future<UserCredential?>  signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    log(loginResult.status.toString());
    if (loginResult.status == LoginStatus.success) {
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } else {
      return null;
    }
  }

  static Future<UserCredential?> signInWithEmail(String email, String password, FToast fToast) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      fToast.showToast(
          gravity: ToastGravity.TOP,
          child: alertToast(message: 'Error: ${e.message}'),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 40,
              left: 20,
              right: 20,
            );
          });
      return null;
    }
  }

  static Future<UserCredential?> signUpWithEmail(String email, String password, FToast fToast) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      fToast.showToast(
          gravity: ToastGravity.TOP,
          child: alertToast(message: 'Error: ${e.message}'),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 40,
              left: 20,
              right: 20,
            );
          });
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
