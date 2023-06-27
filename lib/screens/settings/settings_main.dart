import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/header.dart';
import 'enterprise_settings_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Models/user/user_model.dart';
import '../../components/button.dart';
import '../../components/settings_cellule.dart';
import '../../config.dart';
import '../../main.dart';
import '../auth/form/form_user.dart';
import 'package:page_transition/page_transition.dart';
import '../../api.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  bool loading = true;
  bool notif = false;
  String value = "Entreprise params";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(COLLECTION_USER)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            loading = false;
            if (snapshot.hasData && snapshot.data!.exists) {
              UserModel user = UserModel.fromJson(snapshot.data!.data()!);
              return !loading
                  ? SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(
                            invertColor: true,
                            title: 'Paramètres',
                            titleSize: 24.sp,
                            titleWeight: FontWeight.w500,
                            onTapBackButton: () => Navigator.pop(context),
                            leftWidget: user.profilePicture != null
                                ? CachedNetworkImage(
                                    imageUrl: user.profilePicture!,
                                    imageBuilder: (context, imageProvider) {
                                      return Container(
                                        width: 48.w,
                                        height: 48.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: imageProvider), shape: BoxShape.circle),
                                      );
                                    },
                                  )
                                : Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                        image:
                                            DecorationImage(image: AssetImage('assets/image/no_profile_picture.jpeg')),
                                        shape: BoxShape.circle),
                                  ),
                          ),
                          SizedBox(height: 25.h),
                          Container(
                              height: 0.5, width: double.infinity, color: AppColor.primaryColor.withOpacity(0.14)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 11.w),
                            child: SingleChildScrollView(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                SizedBox(height: 11.h),
                                FutureBuilder(
                                    future: haveAnEntreprise(FirebaseAuth.instance.currentUser!.uid),
                                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Object?>?> doc) {
                                      if (doc.hasData)
                                        return SettingsCellule(
                                          icon: Icons.business_center_rounded,
                                          text: 'Votre Entreprise',
                                          miniText: doc.data!['nom'],
                                          onTap: () => Navigator.push(
                                              context,
                                              PageTransition(
                                                  duration: Duration(milliseconds: 400),
                                                  type: PageTransitionType.rightToLeftWithFade,
                                                  child: EnterpriseSettingsMain(uid: doc.data!['uid']))),
                                        );
                                      else {
                                        return SizedBox();
                                      }
                                    }),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Sécurité",
                                  miniText: "Mot de passe, tel, email..",
                                  icon: Icons.lock,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            duration: Duration(milliseconds: 400),
                                            type: PageTransitionType.rightToLeftWithFade,
                                            child: Scaffold(
                                                body: FormUser(
                                              backButton: true,
                                              isEdit: true,
                                            ))));
                                  },
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: 'Notifications push',
                                  miniText: notif ? "Activées" : "Désactivées",
                                  icon: Icons.notifications,
                                  onSwitch: (isTrue) {
                                    setState(() {
                                      notif = isTrue;
                                    });
                                  },
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Pages d'aide",
                                  icon: Icons.help,
                                  //TODO PAGES AIDE LINK
                                  launchUri: Uri.parse('https://intra.epitech.eu/'),
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Demandes d'assistances",
                                  miniText: "Appelez-nous",
                                  icon: Icons.phone_callback_rounded,
                                  launchUri: Uri(scheme: 'tel', path: '+1-555-010-999'),
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Contactez-nous",
                                  miniText: "Contactez-nous par email",
                                  icon: Icons.mail_rounded,
                                  launchUri: Uri(scheme: 'mailto', path: 'smith@example.com'),
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Notre page Facebook",
                                  svgIcon: 'assets/svg/facebook.svg',
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Notre Linkedin",
                                  svgIcon: 'assets/svg/linkedin.svg',
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Notre Instagram",
                                  svgIcon: "assets/svg/instagram.svg",
                                ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "Notre Github (Projet sources)",
                                  svgIcon: "assets/svg/github.svg",
                                ),
                                // SizedBox(height: 11.h),
                                // SettingsCellule(
                                //   text: "Politique de confidentialité",
                                // ),
                                //        SizedBox(height: 11.h),
                                // SettingsCellule(
                                //   text: "Conditions générales de ventes et d’utilisation",
                                // ),
                                //        SizedBox(height: 11.h),
                                // SettingsCellule(
                                //   text: "Mentions légales",
                                // ),
                                SizedBox(height: 11.h),
                                SettingsCellule(
                                  text: "À propos",
                                  icon: Icons.info_rounded,
                                ),
                                SizedBox(height: 11),
                                SettingsCellule(
                                  onTap: () async {
                                    loading = true;
                                    if (await GoogleSignIn().isSignedIn()) {
                                      GoogleSignIn().signOut();
                                    }
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                                  },
                                  withArrow: false,
                                  text: 'Se déconnecter',
                                  textAndIconColor: Colors.red,
                                  icon: Icons.logout_rounded,
                                ),
                                SizedBox(height: 20.h),
                                TextButtonUpdated(
                                  text: 'Édité par ',
                                  clicktextButton: 'martinsaison.fr',
                                  onTap: () => launchURL(Uri.parse('https://martinsaison.fr')),
                                ),
                                SizedBox(height: 150.h)
                              ]),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SpinKitWave(
                      color: AppColor.primaryColor,
                    );
            } else {
              return Center(
                  child: Text(
                "Error: cannot get profile.",
                style: TextStyle(color: AppColor.errorColor, fontWeight: FontWeight.w600),
              ));
            }
          }),
    );
  }
}