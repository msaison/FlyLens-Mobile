import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../components/alert_toast.dart';
import '../../../helper.dart';
import '../../../main.dart';
import 'package:google_place/google_place.dart';
import '../../../components/button.dart';
import '../../../components/form_fields.dart';
import '../../../components/header.dart';
import '../../../config.dart';
import 'package:uuid/uuid.dart';
import '../../../api.dart';

class FormCompany extends StatefulWidget {
  const FormCompany({Key? key}) : super(key: key);

  @override
  State<FormCompany> createState() => _FormCompanyState();
}

class _FormCompanyState extends State<FormCompany> {
  final _formKey = GlobalKey<FormState>();
  var googlePlace = GooglePlace(GOOGLE_PLACES_API);

  final FocusNode focusNom = FocusNode();
  final FocusNode focusSiret = FocusNode();
  final FocusNode focusAdress = FocusNode();
  final FocusNode focusAdressBis = FocusNode();
  final FocusNode focusTel = FocusNode();
  final FocusNode focusTelBis = FocusNode();
  final FocusNode focusMail = FocusNode();

  final TextEditingController controllerNom = TextEditingController();
  final TextEditingController controllerSiret = TextEditingController();
  final TextEditingController controllerAdress = TextEditingController();
  final TextEditingController controllerAdressBis = TextEditingController();
  final TextEditingController controllerTel = TextEditingController();
  final TextEditingController controllerTelBis = TextEditingController();
  final TextEditingController controllerMail = TextEditingController();

  FToast fToast = FToast();

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

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
                      hintText: 'Ex. FlyLens',
                      cursorColor: AppColor.primaryColor,
                      focusNode: focusNom,
                      nextFocusNode: focusSiret,
                      controller: controllerNom,
                      onChanged: (value) {
                        setState(() {});
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
                      hintText: 'Ex. 291920309',
                      textInputType: TextInputType.number,
                      focusNode: focusSiret,
                      nextFocusNode: focusTel,
                      controller: controllerSiret,
                      onChanged: (value) {
                        setState(() {});
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(9),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ce champ est obligatoire.';
                        } else {
                          if (value.length < 9) {
                            return 'Un SIREN valide contient 9 chiffres.';
                          } else if (value.isNonDigit) {
                            return 'Seul les chiffres sont autorisé.';
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    TextFormUpdated.phoneNumber(
                      fieldName: 'Numéro de téléphone*',
                      controller: controllerTel,
                      focusNode: focusTel,
                      nextFocusNode: focusTelBis,
                      onInputChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    TextFormUpdated.phoneNumber(
                      fieldName: 'Second Numéro de téléphone',
                      controller: controllerTelBis,
                      focusNode: focusTelBis,
                      onInputChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    TextFormUpdated.classic(
                      fieldName: "Adresse de l'entreprise*",
                      hintText: 'Ex. 12 Avenue Pauliani',
                      controller: controllerAdress,
                      focusNode: focusAdress,
                      onChanged: (value) {
                        setState(() {});
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
                      fieldName: "Seconde adresse de l'entreprise*",
                      hintText: 'Ex. 12 Avenue Pauliani',
                      controller: controllerAdressBis,
                      focusNode: focusAdressBis,
                      onChanged: (value) {
                        setState(() {});
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
                          if (await Api().infoSiren("429815581") != 200) {
                            // Future.delayed(Duration(seconds: 2), () {
                            fToast.showToast(
                                gravity: ToastGravity.TOP,
                                child: alertToast(message: "SIREN isn't valid. Please use a valid SIREN."),
                                positionedToastBuilder: (context, child) {
                                  return Positioned(
                                    child: child,
                                    top: 40,
                                    left: 20,
                                    right: 20,
                                  );
                                });
                            // });
                          } else {
                            String uuid = Uuid().v4();
                            await FirebaseFirestore.instance
                                .collection(COLLECTION_USER)
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              'enterprise': [uuid]
                            });
                            await FirebaseFirestore.instance.collection(COLLECTION_ENTERPRISE).doc(uuid).set({
                              "nom": controllerNom.text,
                              "siret": controllerSiret.text,
                              "adresse": controllerAdress.text,
                              "ownerId": FirebaseAuth.instance.currentUser!.uid,
                              "uid": uuid,
                            });
                            Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                          }
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


// SizedBox(height: 14.h),
// GooglePlaceFormField(
//   focusNode: focusAdress,
//   textEditingController: controllerAdress,
//   fieldName: "Adresse de l'entreprise*",
//   googlePlace: googlePlace,
// ),
// SizedBox(height: 14.h),
// GooglePlaceFormField(
//   focusNode: focusAdress,
//   textEditingController: controllerAdress,
//   fieldName: "Seconde Adresse de l'entreprise",
//   googlePlace: googlePlace,
// ),