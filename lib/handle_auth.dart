import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'config.dart';
import '../../api.dart';

Future<Widget?> handleAuth({
  required Map<String, RedirectionHandle> redirections,
  required Widget firstPage,
  Widget? onBoarding,
}) async {
  bool firstTime = true;
  final LocalStorage storage = new LocalStorage('flylens');
  if (await storage.ready) {
    firstTime = storage.getItem('oneConnection') ?? true;
    if (firstTime) storage.setItem('oneConnection', false);
  }
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser == null) {
    // if (onBoarding != null && firstTime) {
    //   return onBoarding;
    // }
    return onBoarding;
    // return firstPage;
  } else {
    if (MULTIPLE_ACCOUNT_TYPE) {
      UserRedirectionObject? userRedirection = await getUserInfo();
      if (userRedirection != null) {
        if (userRedirection.documentSnapshot.get("registrationDone") == true) {
          return redirections[userRedirection.acountType]!.homePage;
        } else {
          if (userRedirection.documentSnapshot.get("socialRegister") == true) {
            return redirections[userRedirection.acountType]!.socialRegister;
          } else
            return redirections[userRedirection.acountType]!.normalRegister;
        }
      }
    } else {
      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection(redirections.keys.first).doc(currentUser.uid).get();
      if (doc.get("registrationDone") == true) {
        Map<String, dynamic> _doc = doc.data() as Map<String, dynamic>;
        if (_doc["enterprise"] == null || doc.get("enterprise").length <= 0) {
          return redirections.values.first.entreprise;
        } else {
          return redirections.values.first.homePage;
        }
      } else {
        if (doc.get("socialRegister") == true) {
          return redirections.values.first.socialRegister;
        } else {
          return redirections.values.first.normalRegister;
        }
      }
    }
  }
  return null;
}

class RedirectionHandle {
  Widget normalRegister;
  Widget? socialRegister;
  Widget entreprise;
  Widget homePage;
  RedirectionHandle({
    required this.normalRegister,
    required this.homePage,
    required this.entreprise,
    this.socialRegister,
  });
}

class UserRedirectionObject {
  String acountType;
  DocumentSnapshot documentSnapshot;
  UserRedirectionObject({required this.acountType, required this.documentSnapshot});
}

Future<UserRedirectionObject?> getUserInfo() async {
  int index = 0;
  DocumentSnapshot? doc;
  while (index < ACCOUNT_TYPES.length) {
    doc = await FirebaseFirestore.instance
        .collection(ACCOUNT_TYPES[index])
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (doc.exists) {
      return UserRedirectionObject(acountType: ACCOUNT_TYPES[index], documentSnapshot: doc);
    }
    index++;
  }
  return null;
}
