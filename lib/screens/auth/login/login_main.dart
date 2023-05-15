// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flylens/components/alert_toast.dart';
import 'package:flylens/components/auth_service.dart';
import 'package:flylens/components/button.dart';
import 'package:flylens/components/form_fields.dart';
import 'package:flylens/config.dart';
import 'package:flylens/main.dart';
import 'package:flylens/screens/auth/register/register_main.dart';
import 'package:flylens/screens/auth/reset_password/reset_password_main.dart';
import 'package:page_transition/page_transition.dart';

import '../../../api.dart';

class LoginMain extends StatefulWidget {
  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_formKEy');
  FToast fToast = FToast();
  ScrollController? _scrollController = ScrollController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  FocusNode? passwordFocus = FocusNode();
  FocusNode? emailFocus = FocusNode();
  bool passwordObscuring = true;
  bool loading = false;

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          !loading
              ? SingleChildScrollView(
                  controller: _scrollController,
                  child: Form(
                    key: _formKey,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 29.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 60.h),
                              SvgPicture.asset(
                                "assets/svg/logo.svg",
                                color: AppColor.primaryColor,
                                height: 50.h,
                              ),
                              SizedBox(height: 30.h),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Connectez-vous',
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 30.h),
                              TextFormUpdated.classic(
                                controller: emailController,
                                focusNode: emailFocus,
                                nextFocusNode: passwordFocus,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.emailAddress,
                                fieldName: "Entrez votre adresse e-mail",
                                hintText: "Adresse e-mail",
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Ce champ est obligatoire.';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return 'Ce champ est obligatoire.';
                                  }
                                },
                              ),
                              SizedBox(height: 17.h),
                              TextFormUpdated.classic(
                                controller: passwordController,
                                focusNode: passwordFocus,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.visiblePassword,
                                obscuringText: passwordObscuring,
                                fieldName: "Entrez votre mot de passe",
                                hintText: "Mot de passe",
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Ce champ est obligatoire.';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return 'Ce champ est obligatoire.';
                                  }
                                },
                                suffixChildBoxConstraint: BoxConstraints(minWidth: 50.w),
                                suffixChild: Ink(
                                    child: IconButton(
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      passwordObscuring = !passwordObscuring;
                                    });
                                  },
                                  icon: Icon(
                                      !passwordObscuring ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill),
                                  color: passwordObscuring
                                      ? AppColor.primaryColor.withOpacity(0.35)
                                      : AppColor.primaryColor,
                                )),
                              ),
                              SizedBox(height: 17.h),
                              TextButtonUpdated(
                                text: 'Mot de passe oublié ? ',
                                clicktextButton: 'Réinitialiser',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 400),
                                          type: PageTransitionType.rightToLeftWithFade,
                                          child: ResetPasswordMain()));
                                },
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Button(
                                textButton: "Continuer",
                                loading: loading,
                                width: 317,
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    UserCredential? account = await AuthHelper.signInWithEmail(
                                        emailController!.text, passwordController!.text, fToast);
                                    if (account != null) {
                                      Navigator.pushAndRemoveUntil(
                                          context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                                    } else {
                                      setState(() {
                                        loading = false;
                                      });
                                      Future.delayed(Duration(seconds: 2), () {
                                        fToast.showToast(
                                            gravity: ToastGravity.TOP,
                                            child: alertToast(message: 'Aborted connection, please try again.'),
                                            positionedToastBuilder: (context, child) {
                                              return Positioned(
                                                child: child,
                                                top: 40,
                                                left: 20,
                                                right: 20,
                                              );
                                            });
                                      });
                                    }
                                  }
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ou connectez-vous avec',
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.fiveColor)),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 26.0.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    googleorfacebooksigninbutton(),
                                    googleorfacebooksigninbutton(google: false)
                                  ],
                                ),
                              ),
                              SizedBox(height: 13.h),
                              Container(height: 1.h, width: 37.w, color: AppColor.primaryColor.withOpacity(0.1)),
                              SizedBox(height: 26.h),
                              TextButtonUpdated(
                                clicktextButton: 'Créer maintenant',
                                text: 'Pas de compte ? ',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          duration: Duration(milliseconds: 400),
                                          type: PageTransitionType.rightToLeftWithFade,
                                          child: RegisterMain()));
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: SpinKitWave(
                  color: AppColor.primaryColor,
                )),
        ],
      ),
    );
  }

  Widget googleorfacebooksigninbutton({bool google = true}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: TextButton(
            onPressed: () async {
              setState(() {
                loading = true;
              });
              UserCredential? account;
              if (google) {
                account = await AuthHelper.signInWithGoogle();
              } else {
                account = await AuthHelper.signInWithFacebook();
              }
              if (account != null) {
                bool exist = await AuthHelper.existDocWithId(COLLECTION_USER, account.user!.uid);
                if (!exist) {
                  await FirebaseFirestore.instance.collection(COLLECTION_USER).doc(account.user!.uid).set({
                    "socialRegister": true,
                    "profilePicture": account.user!.photoURL,
                    "registrationDone": false,
                    "email": account.user!.email,
                  });
                }
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
              } else {
                setState(() {
                  loading = false;
                });
                fToast.showToast(
                    gravity: ToastGravity.TOP,
                    child: alertToast(message: 'Aborted connection, please try again.'),
                    positionedToastBuilder: (context, child) {
                      return Positioned(
                        child: child,
                        top: 40,
                        left: 20,
                        right: 20,
                      );
                    });
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    google ? 'assets/svg/google.svg' : 'assets/svg/facebook.svg',
                    height: 25.h,
                  ),
                ],
              ),
            ),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) => Colors.grey.withOpacity(0.3)),
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black.withOpacity(0.25), width: 0.5, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(7),
                )))),
      ),
    );
  }
}