import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flylens/Models/weather/weather_model.dart';
import 'dart:math';

import 'Models/fields/fields_model.dart';
import '../../api.dart';

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isStrongPassword {
    final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this.isNotEmpty;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isNonDigit {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(this);
  }
}

extension extStringNull on String? {
  bool get isValidPasswordNull {
    if (this != null) {
      final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
      return passwordRegExp.hasMatch(this!);
    } else {
      return false;
    }
  }
}

Widget inkWell({
  VoidCallback? onTap,
  BorderRadius borderRadius = BorderRadius.zero,
  EdgeInsetsGeometry padding = EdgeInsets.zero,
  BoxConstraints? constraints,
  Key? key,
  Color? splashColor,
  Color? highlightColor,
  required Decoration decoration,
  required Widget child,
}) =>
    Container(
      key: key,
      decoration: decoration,
      constraints: constraints,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          highlightColor: highlightColor,
          splashColor: splashColor,
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );

const _chars = '1234567890';
Random _rnd = Random();

String getRandomCode(int length) =>
    String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

Future<DocumentSnapshot?> haveAnEntreprise(String ownerId) async {
  final snapshot =
      await FirebaseFirestore.instance.collection('Enterprises').where('ownerId', isEqualTo: ownerId).limit(1).get();
  if (snapshot.docs.isNotEmpty) {
    return snapshot.docs.first;
  } else {
    return null;
  }
}

Future<List<FieldsModel>> getAllFields(String uuid) async {
  List<FieldsModel> models = [];
  QuerySnapshot<Map<String, dynamic>> doc =
      await FirebaseFirestore.instance.collection(COLLECTION_ENTERPRISE).doc(uuid).collection('Fields').get();

  doc.docs.forEach((element) {
    models.add(FieldsModel.fromJson(element.data()));
  });

  return models;
}

Future<List<WeatherModel>?> getAllWeather() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    List<WeatherModel> models = [];
    QuerySnapshot<Map<String, dynamic>> doc =
        await FirebaseFirestore.instance.collection(COLLECTION_USER).doc(user.uid).collection('Weather').get();

    doc.docs.forEach((element) {
      models.add(WeatherModel.fromJson(element.data()));
    });

    return models;
  } else
    return null;
}

Future<List<FieldsModel>?> getAllFieldsWithUserId(String uuid) async {
  List<FieldsModel> models = [];
  final snapshot =
      await FirebaseFirestore.instance.collection('Enterprises').where('ownerId', isEqualTo: uuid).limit(1).get();
  if (snapshot.docs.isNotEmpty) {
    QuerySnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
        .collection(COLLECTION_ENTERPRISE)
        .doc(snapshot.docs.first.data()['uid'])
        .collection('Fields')
        .get();

    doc.docs.forEach((element) {
      models.add(FieldsModel.fromJson(element.data()));
    });
    return models;
  } else {
    return null;
  }
}

Future<String?> getProfilePicture(String documentId) async {
  final docRef = FirebaseFirestore.instance.collection('Users').doc(documentId);
  final snapshot = await docRef.get();
  final data = snapshot.data();
  if (data != null && data.containsKey('profilePicture')) {
    return data['profilePicture'];
  } else {
    return null;
  }
}
