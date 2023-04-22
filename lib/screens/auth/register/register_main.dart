// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flylens/components/auth_service.dart';
import 'package:flylens/components/button.dart';
import 'package:flylens/components/form_fields.dart';
import 'package:flylens/components/header.dart';
import 'package:flylens/config.dart';
import 'package:flylens/main.dart';
import '../../../components/alert_toast.dart';
import '../../../helper.dart';
import '../../../api.dart';


class RegisterMain extends StatefulWidget {
  @override
  State<RegisterMain> createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  FToast fToast = FToast();
  final _formKey = GlobalKey<FormState>(debugLabel: '_formKEy');
  final ScrollController? _scrollController = ScrollController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? passwordConfirmController = TextEditingController();
  final FocusNode? emailNode = FocusNode();
  final FocusNode? passwordNode = FocusNode();
  final FocusNode? passwordConfirmNode = FocusNode();
  String? password;
  bool passwordObscuring = true;
  bool passwordConfirmObscuring = true;
  bool loading = false;
  double passwordStrength = 0;

  bool more8char = false;
  bool haveMaj = false;
  bool haveSym = false;
  bool haveNumber = false;

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 90.h),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Creez votre compte',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Header(
                    invertColor: true,
                    hasTitle: false,
                    onTapBackButton: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 200.h),
                        TextFormUpdated.classic(
                          controller: emailController,
                          nextFocusNode: passwordNode,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.emailAddress,
                          fieldName: "Quelle est votre adresse e-mail ?",
                          hintText: "Entrez votre adresse e-mail",
                          validator: (value) {
                            if (value != null) {
                              if (value.isEmpty) {
                                return 'Ce champ est obligatoire.';
                              } else if (!value.isValidEmail) {
                                return 'Entrez une adresse mail valide';
                              } else {
                                return null;
                              }
                            } else {
                              return 'Ce champ est obligatoire.';
                            }
                          },
                        ),
                        SizedBox(height: 17.h),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ProgressPasswordStrongBar(passwordStrength: passwordStrength),
                            TextFormUpdated.classic(
                              controller: passwordController,
                              focusNode: passwordNode,
                              nextFocusNode: passwordConfirmNode,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.visiblePassword,
                              obscuringText: passwordObscuring,
                              validator: (value) {
                                if (passwordStrength != 1) {
                                  return '';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                });
                                verifPassword(value);
                                passwordStrength = ((more8char ? 0.25 : 0) +
                                    (haveMaj ? 0.25 : 0) +
                                    (haveSym ? 0.25 : 0) +
                                    (haveNumber ? 0.25 : 0));
                              },
                              fieldName: "Créer un mot de passe",
                              hintText: "Mot de passe",
                              suffixChildBoxConstraint: BoxConstraints(minWidth: 50.w),
                              suffixChild: Ink(
                                  child: IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    passwordObscuring = !passwordObscuring;
                                  });
                                },
                                icon:
                                    Icon(!passwordObscuring ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill),
                                color:
                                    passwordObscuring ? AppColor.primaryColor.withOpacity(0.35) : AppColor.primaryColor,
                              )),
                            ),
                          ],
                        ),
                        passwordVerifColumn(),
                        SizedBox(height: 17.h),
                        TextFormUpdated.classic(
                          textInputAction: TextInputAction.next,
                          controller: passwordConfirmController,
                          focusNode: passwordConfirmNode,
                          textInputType: TextInputType.visiblePassword,
                          obscuringText: passwordConfirmObscuring,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ce champ est obligatoire.';
                            } else if (value != password) {
                              return ('Les mots de passes ne corresponds pas.');
                            }
                            return null;
                          },
                          fieldName: "Confirmer votre mot de passe",
                          hintText: "Mot de passe",
                          suffixChildBoxConstraint: BoxConstraints(minWidth: 50.w),
                          suffixChild: Ink(
                            child: IconButton(
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    passwordConfirmObscuring = !passwordConfirmObscuring;
                                  });
                                },
                                icon: Icon(
                                    !passwordConfirmObscuring ? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill,
                                    color: passwordConfirmObscuring
                                        ? AppColor.primaryColor.withOpacity(0.35)
                                        : AppColor.primaryColor)),
                          ),
                        ),
                        SizedBox(height: 17.h),
                        SizedBox(
                          height: 25.h,
                        ),
                        Button(
                            loading: loading,
                            textButton: "Continuer",
                            isEnabled: _formKey.currentState != null
                                ? _formKey.currentState!.validate()
                                    ? true
                                    : false
                                : false,
                            width: 317,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                                UserCredential? account = await AuthHelper.signUpWithEmail(
                                    emailController!.text, passwordController!.text, fToast);
                                if (account != null) {
                                  bool exist = await AuthHelper.existDocWithId(COLLECTION_USER, account.user!.uid);
                                  if (!exist) {
                                    await FirebaseFirestore.instance
                                        .collection(COLLECTION_USER)
                                        .doc(account.user!.uid)
                                        .set({
                                      "socialRegister": false,
                                      "profilePicture": null,
                                      "registrationDone": false,
                                      "email": account.user!.email,
                                    });
                                  }
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                                } else {
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
                              }
                            }),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('ou inscrivez-vous avec',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.fiveColor)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 28.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                                  child: TextButton(
                                      onPressed: () async {
                                        UserCredential? account = await AuthHelper.signInWithGoogle();
                                        if (account != null) {
                                          bool exist =
                                              await AuthHelper.existDocWithId(COLLECTION_USER, account.user!.uid);
                                          if (!exist) {
                                            await FirebaseFirestore.instance
                                                .collection(COLLECTION_USER)
                                                .doc(account.user!.uid)
                                                .set({
                                              "socialRegister": true,
                                              "profilePicture": account.user!.photoURL,
                                              "registrationDone": false,
                                              "email": account.user!.email,
                                            });
                                          }
                                          Navigator.pushAndRemoveUntil(
                                              context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                                        } else {
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
                                              "assets/svg/google.svg",
                                              height: 25.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      style: ButtonStyle(
                                          overlayColor: MaterialStateProperty.resolveWith(
                                              (states) => Colors.grey.withOpacity(0.3)),
                                          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white),
                                          shape:
                                              MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.black.withOpacity(0.25),
                                                width: 0.5,
                                                style: BorderStyle.solid),
                                            borderRadius: BorderRadius.circular(7),
                                          )))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  ///////////////////        UTILS PASSWORD FORM        ////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  void verifPassword(String value) {
    if (value != null) {
      if (value.length >= 8) {
        setState(() {
          more8char = true;
        });
      } else {
        setState(() {
          more8char = false;
        });
      }
      if (value.contains(RegExp(r'[A-Z]'))) {
        setState(() {
          haveMaj = true;
        });
      } else {
        setState(() {
          haveMaj = false;
        });
      }
      if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        setState(() {
          haveSym = true;
        });
      } else {
        setState(() {
          haveSym = false;
        });
      }
      if (value.contains(RegExp(r'[0-9]'))) {
        setState(() {
          haveNumber = true;
        });
      } else {
        setState(() {
          haveNumber = false;
        });
      }
    }
  }

  Column passwordVerifColumn() {
    return Column(
      children: [
        SizedBox(height: 5.h),
        Row(children: [
          Icon(
            more8char ? Icons.done_rounded : Icons.clear_rounded,
            size: 12,
            color: more8char ? AppColor.successColor : AppColor.errorColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text('Plus de 8 caractères', style: TextStyle(fontSize: 10.sp))
        ]),
        Row(children: [
          Icon(
            haveMaj ? Icons.done_rounded : Icons.clear_rounded,
            size: 12,
            color: haveMaj ? AppColor.successColor : AppColor.errorColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text('Au moins une majuscule', style: TextStyle(fontSize: 10.sp))
        ]),
        Row(children: [
          Icon(
            haveSym ? Icons.done_rounded : Icons.clear_rounded,
            size: 12,
            color: haveSym ? AppColor.successColor : AppColor.errorColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text('Au moins un symbole(!?&#\$*)', style: TextStyle(fontSize: 10.sp))
        ]),
        Row(children: [
          Icon(
            haveNumber ? Icons.done_rounded : Icons.clear_rounded,
            size: 12,
            color: haveNumber ? AppColor.successColor : AppColor.errorColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text('Au moins un chiffre', style: TextStyle(fontSize: 10.sp))
        ])
      ],
    );
  }
}

class ProgressPasswordStrongBar extends StatelessWidget {
  const ProgressPasswordStrongBar({
    Key? key,
    required this.passwordStrength,
  }) : super(key: key);

  final double passwordStrength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.5.w),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100.r), bottomRight: Radius.circular(100.r)),
        child: LinearProgressIndicator(
          value: passwordStrength,
          backgroundColor: Colors.grey.withOpacity(0.3),
          color: passwordStrength <= 1 / 4
              ? Colors.red
              : passwordStrength == 2 / 4
                  ? Colors.yellow
                  : passwordStrength == 3 / 4
                      ? Colors.orange
                      : Colors.green,
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

}
