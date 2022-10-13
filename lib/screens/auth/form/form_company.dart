import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/button.dart';
import '../../../components/form_fields.dart';
import '../../../components/header.dart';
import '../../../config.dart';
import '../../../helper.dart';
import 'package:uuid/uuid.dart';

class FormCompany extends StatefulWidget {
  const FormCompany({Key? key}) : super(key: key);

  @override
  State<FormCompany> createState() => _FormCompanyState();
}

class _FormCompanyState extends State<FormCompany> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode focusNom = FocusNode();
  final FocusNode focusSiret = FocusNode();
  final FocusNode focusAdress = FocusNode();

  String? nom;
  String? siret;
  String? adresse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              title: 'Créez votre entreprise',
              invertColor: true,
              titleSize: 23,
              onTapBackButton: () => Navigator.pop(context),
            ),
            SizedBox(height: 46.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 29.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormUpdated.classic(
                      fieldName: 'Nom*',
                      hintText: 'Ex. John',
                      cursorColor: AppColor.primaryColor,
                      focusNode: focusNom,
                      nextFocusNode: focusSiret,
                      onChanged: (value) {
                        setState(() {
                          nom = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ce champ est obligatoire.';
                        } else {
                          if (value.isValidName) return ('Un ou plusieurs charactères ne sont pas accepter.');
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    TextFormUpdated.classic(
                      fieldName: 'Siret*',
                      hintText: 'Ex. Doe',
                      focusNode: focusSiret,
                      nextFocusNode: focusAdress,
                      onChanged: (value) {
                        setState(() {
                          siret = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ce champ est obligatoire.';
                        } else {
                          if (value.isValidName) return ('Un ou plusieurs charactères ne sont pas accepter.');
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    TextFormUpdated.classic(
                      fieldName: 'Adresse*',
                      hintText: 'Ex. 12 Avenue Pauliani',
                      focusNode: focusAdress,
                      onChanged: (value) {
                        setState(() {
                          adresse = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ce champ est obligatoire.';
                        } else {
                          if (value.isValidName) return ('Un ou plusieurs charactères ne sont pas accepter.');
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32.h),
                    Button(
                      textButton: 'Suivant',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          String uuid = Uuid().v4();
                          await FirebaseFirestore.instance
                              .collection(COLLECTION_USER)
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .update({
                            'enterprise': [uuid]
                          });
                          await FirebaseFirestore.instance.collection(COLLECTION_ENTERPRISE).doc(uuid).set({
                            "nom": nom,
                            "siret": siret,
                            "adresse": adresse,
                            "ownerId": FirebaseAuth.instance.currentUser!.uid,
                            "uid": uuid,
                          });
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    SizedBox(height: 21.1.h),
                    Text(
                      '* Les champs marqués sont obligatoires.',
                      style: TextStyle(color: AppColor.primaryColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
