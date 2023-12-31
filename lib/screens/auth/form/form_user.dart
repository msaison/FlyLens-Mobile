import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api.dart';
import '../../../components/button.dart';
import '../../../components/form_fields.dart';
import '../../../components/header.dart';
import '../../../config.dart';
import '../../../helper.dart';
import '../../../main.dart';

class FormUser extends StatefulWidget {
  final bool backButton;
  final bool isEdit;
  const FormUser({this.backButton = false, this.isEdit = false, Key? key}) : super(key: key);

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode focusPrenom = FocusNode();
  final FocusNode focusNom = FocusNode();
  final FocusNode focusTel = FocusNode();
  final FocusNode focusNaissance = FocusNode();
  final FocusNode focusSexe = FocusNode();

  String? prenom;
  String? nom;
  String? tel;
  DateTime? naissance;
  String? sexe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(
            title: widget.isEdit ? 'Modifier votre profile' : 'Créez votre profile',
            invertColor: true,
            titleSize: 23,
            onTapBackButton: widget.backButton
                ? () {
                    Navigator.pop(context);
                  }
                : null,
          ),
          SizedBox(height: 46.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormCustom.classic(
                    fieldName: 'Prénom*',
                    hintText: 'Ex. John',
                    cursorColor: AppColor.primaryColor,
                    focusNode: focusPrenom,
                    nextFocusNode: focusNom,
                    onChanged: (value) {
                      setState(() {
                        prenom = value;
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
                  TextFormCustom.classic(
                    fieldName: 'Nom*',
                    hintText: 'Ex. Doe',
                    focusNode: focusNom,
                    nextFocusNode: focusTel,
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
                  TextFormCustom.phoneNumber(
                    fieldName: 'Numéro de téléphone*',
                    // controller: controllerTel,
                    focusNode: focusTel,
                    nextFocusNode: focusNaissance,
                    onInputChanged: (value) {
                      setState(() {
                        tel = value.phoneNumber;
                      });
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),
                  TextFormCustom.dateTime(
                    fieldName: 'Date de naissance*',
                    hintText: '01/02/1997',
                    focusNode: focusNaissance,
                    nextFocusNode: focusSexe,
                    onChangedDate: (value) {
                      setState(() {
                        naissance = value;
                      });
                    },
                    validatorDate: (value) {
                      if (value == null) {
                        return 'Ce champ est obligatoire.';
                      } else {
                        if (value.isAfter(DateTime(DateTime.now().year - 16)))
                          return ('Vous devez avoir au moins 16 ans.');
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14.h),
                  SelectForm(
                    fieldName: 'Sexe*',
                    focusNode: focusSexe,
                    onChangedSelect: (String? value) {
                      setState(() {
                        sexe = value;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ est obligatoire.';
                      }
                      return null;
                    },
                    items: [
                      DropdownMenuItem(
                        child: Text('Homme'),
                        value: 'Homme',
                      ),
                      DropdownMenuItem(
                        child: Text('Femme'),
                        value: 'Femme',
                      ),
                      DropdownMenuItem(
                        child: Text('N/a'),
                        value: 'N/a',
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Button(
                    textButton: 'Suivant',
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await FirebaseFirestore.instance
                            .collection(COLLECTION_USER)
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update(widget.isEdit
                                ? {
                                    "nom": nom,
                                    "prenom": prenom,
                                    "naissance": Timestamp.fromDate(naissance!),
                                    "sexe": sexe,
                                    "phone": tel
                                  }
                                : {
                                    "nom": nom,
                                    "prenom": prenom,
                                    "naissance": Timestamp.fromDate(naissance!),
                                    "sexe": sexe,
                                    "phone": tel,
                                    "registrationDone": true,
                                  });
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
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
    );
  }
}
