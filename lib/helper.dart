import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Models/analyse/analyse_model.dart';
import 'Models/weather/weather_model.dart';
import 'components/providers/analyses.dart';
import 'components/tuple.dart';
import 'config.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'dart:math';

import 'Models/fields/fields_model.dart';
import '../../api.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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

Future<List<DocumentSnapshot>> getUserIdsFromEnterprisesDocument(String documentId) async {
  List<String> userIds = [];
  try {
    DocumentReference documentRef = FirebaseFirestore.instance.collection('Enterprises').doc(documentId);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists && documentSnapshot.data() is Map<String, dynamic>) {
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

      if (data.containsKey('userIds')) {
        List<dynamic> userIdsData = data['userIds'];
        userIds = userIdsData.map((userId) => userId.toString()).toList();
      } else {
        print('The document does not contain the "userIds" field.');
      }
    } else {
      print('The document does not exist or is not of the expected type.');
    }
  } catch (error) {
    print('An error occurred: $error');
  }
  return getUserDocuments(userIds);
}

Future<List<DocumentSnapshot>> getUserDocuments(List<String> documentIds) async {
  List<DocumentSnapshot> documents = [];

  try {
    for (String documentId in documentIds) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('Users').doc(documentId).get();

      if (documentSnapshot.exists) {
        documents.add(documentSnapshot);
      } else {
        print('Document with ID $documentId does not exist in the collection.');
      }
    }
  } catch (error) {
    print('An error occurred: $error');
  }

  return documents;
}

Future<List<String>?> fetchImageFields(String? fieldId, String companyId) async {
  String url = 'http://$SERVER.flylens.fr:3000/analyses/mass_retrieve?';
  if (fieldId != null) url = url + 'field_id=$fieldId&';
  url = url + 'company_id=$companyId';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<String> img = [];
      final Map<String, dynamic> map = json.decode(response.body);
      for (var element in map['images_analysis']) {
        for (var element_ in element['analyses']) {
          img.add(element_['analysed_image_url']);
        }
      }
      // final ImageAnalyseModel analyseModel = ImageAnalyseModel.fromJson(json.decode(response.body));
      return img;
    } else {
      return null;
      // throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    return null;
    // throw Exception('Failed to fetch data: $error');
  }
}

Future<AnalyseGlobal?> fetchAnalysisStats({required String companyId, String? fieldId, required WidgetRef ref}) async {
  ref.watch(analyseProvider).findModel('TEST', null);
  String url = 'http://$SERVER.flylens.fr:3000/analyses/stats?';
  if (fieldId != null) url = url + 'field_id=$fieldId&';
  url = url + 'company_id=$companyId';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final AnalyseModel analyseModel = AnalyseModel.fromJson(json.decode(response.body));
      // ref.read(analyseProvider).updateModel(analyseModel, companyId, fieldId);
      await fetchImageFields(null, companyId);
      return AnalyseGlobal(analyseModel: analyseModel, entrepriseID: companyId, lastRefresh: DateTime.now());
    } else {
      print('Failed to fetch analysis stats');
      return null;
    }
  } catch (error) {
    // Handle the error
    print('Error: $error');
    return null;
  }
}

Future<void> removeCrossReferences(String userId, String enterpriseId) async {
  try {
    // Remove enterpriseId from Users collection
    final userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
    await userRef.update({'company': FieldValue.delete()});

    // Remove userId from Enterprises collection
    final enterpriseRef = FirebaseFirestore.instance.collection('Enterprises').doc(enterpriseId);
    await enterpriseRef.update({
      'userIds': FieldValue.arrayRemove([userId]),
    });
  } catch (error) {
    print('Error removing cross-references: $error');
  }
}

// Future<List<FieldsModel>?> getAllFieldsWithUserId(String uuid) async {
//   List<FieldsModel> models = [];
//   final snapshot =
//       await FirebaseFirestore.instance.collection('Enterprises').where('ownerId', isEqualTo: uuid).limit(1).get();
//   if (snapshot.docs.isNotEmpty) {
//     QuerySnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
//         .collection(COLLECTION_ENTERPRISE)
//         .doc(snapshot.docs.first.data()['uid'])
//         .collection('Fields')
//         .get();

//     doc.docs.forEach((element) {
//       models.add(FieldsModel.fromJson(element.data()));
//     });
//     return models;
//   } else {
//     return null;
//   }
// }

//TODO POURQUOI TU TE COMPLIQUE LA VIE
Future<Tuple2<List<FieldsModel>, String>?> fetchFieldsByUserId(String userId) async {
  List<FieldsModel> models = [];
  QuerySnapshot<Map<String, dynamic>> enterpriseSnapshot =
      await FirebaseFirestore.instance.collection('Enterprises').where('ownerId', isEqualTo: userId).get();

  if (enterpriseSnapshot.docs.isEmpty) {
    enterpriseSnapshot =
        await FirebaseFirestore.instance.collection('Enterprises').where('userIds', arrayContains: userId).get();
  }

  if (enterpriseSnapshot.docs.isNotEmpty) {
    DocumentSnapshot<Map<String, dynamic>> enterpriseDocument = enterpriseSnapshot.docs.first;
    QuerySnapshot<Map<String, dynamic>> fieldsSnapshot = await enterpriseDocument.reference.collection('Fields').get();
    fieldsSnapshot.docs.forEach((element) {
      models.add(FieldsModel.fromJson(element.data()));
    });
    return Tuple2(models, enterpriseDocument.id);
  }

  return null;
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

class FrMessagesCustom implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => "";
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => "$seconds secondes";
  @override
  String aboutAMinute(int minutes) => '1 minutes';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => '1 heures';
  @override
  String hours(int hours) => '$hours heures';
  @override
  String aDay(int hours) => '1 jours';
  @override
  String days(int days) => '$days jours';
  @override
  String aboutAMonth(int days) => '1 minutes';
  @override
  String months(int months) => '$months minutes';
  @override
  String aboutAYear(int year) => '1 an';
  @override
  String years(int years) => '$years ans';
  @override
  String wordSeparator() => ' ';
}
