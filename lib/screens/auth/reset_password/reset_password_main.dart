import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flylens/components/alerttoast.dart';
import 'package:flylens/components/button.dart';
import 'package:flylens/components/form_fields.dart';
import 'package:flylens/components/header.dart';
import 'package:flylens/config.dart';

class ResetPasswordMain extends StatefulWidget {
  const ResetPasswordMain({Key? key}) : super(key: key);

  @override
  State<ResetPasswordMain> createState() => _ResetPasswordMainState();
}

class _ResetPasswordMainState extends State<ResetPasswordMain> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_formKEy');
  FToast fToast = FToast();
  final TextEditingController? emailController = TextEditingController();
  final FocusNode? emailFocus = FocusNode();
  bool loading = false;

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Stack(
              children: [
                Header(
                  hasTitle: false,
                  onTapBackButton: () => Navigator.of(context).pop(),
                  invertColor: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Column(
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
                          'Mot de passe oublié ?',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Pour réinitialiser votre mot de passe, renseignez l'adresse email avec laquelle vous vous êtes inscrit.",
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 13.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      TextFormUpdated.classic(
                        controller: emailController,
                        focusNode: emailFocus,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        fieldName: "Adresse email",
                        hintText: "john.doe@gmail.com",
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Ce champ est obligatoire.';
                            } else {
                              return null;
                            }
                          } else {
                            print(value);
                            return 'Ce champ est obligatoire.';
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                      Button(
                        textButton: "Continuer",
                        loading: loading,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            try {
                              FirebaseAuth.instance.sendPasswordResetEmail(email: emailController!.text);
                              setState(() {
                                loading = false;
                              });
                              fToast.showToast(
                                  gravity: ToastGravity.TOP,
                                  child: alertToast(message: 'Email envoyé verifié vos spam!', success: true),
                                  positionedToastBuilder: (context, child) {
                                    return Positioned(
                                      child: child,
                                      top: 40,
                                      left: 20,
                                      right: 20,
                                    );
                                  });
                              Navigator.of(context).pop();
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
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
