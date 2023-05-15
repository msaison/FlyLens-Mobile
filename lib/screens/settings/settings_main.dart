import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'components/main_entreprise_employe.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Models/user/user_model.dart';
import '../../components/button.dart';
import '../../components/settings_cellule.dart';
import '../../components/tuple.dart';
import '../../config.dart';
import '../../helper.dart';
import '../../main.dart';
import '../auth/form/form_user.dart';
import 'components/create_fields/main_create_fields.dart';
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
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(COLLECTION_USER)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            loading = false;
            if (snapshot.hasData && snapshot.data!.exists) {
              UserModel user = UserModel.fromJson(snapshot.data!.data()!);
              return !loading
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 11.w),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 39.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Paramètres',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor, fontSize: 24.sp, fontWeight: FontWeight.w500),
                                ),
                                user.profilePicture != null
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
                                            image: DecorationImage(
                                                image: AssetImage('assets/image/no_profile_picture.jpeg')),
                                            shape: BoxShape.circle),
                                      )
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Container(
                                height: 0.5, width: double.infinity, color: AppColor.primaryColor.withOpacity(0.14)),
                            SingleChildScrollView(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                SizedBox(height: 11.h),
                                FutureBuilder(
                                    future: haveAnEntreprise(FirebaseAuth.instance.currentUser!.uid),
                                    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Object?>?> doc) {
                                      if (doc.hasData)
                                        return ButtonDropDown(
                                          uid: doc.data!['uid'],
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
                          ],
                        ),
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

List<Tuple2<String, IconData>> items = [
  Tuple2("Employer", Icons.person),
  Tuple2("Champs", Icons.business),
];

class ButtonDropDown extends StatefulWidget {
  final String uid;
  const ButtonDropDown({required this.uid, Key? key}) : super(key: key);

  @override
  State<ButtonDropDown> createState() => _ButtonDropDownState();
}

class _ButtonDropDownState extends State<ButtonDropDown> with SingleTickerProviderStateMixin {
  String selectedValue = "Paramètres entreprise";

  double dropDownAngle = -1.55;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Center(
        child: DropdownButton2(
          dropdownPadding: EdgeInsets.zero,
          offset: Offset(0, -20),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
          ),
          // buttonPadding: EdgeInsets.symmetric(horizontal: 20.w),
          isDense: true,
          isExpanded: true,
          // elevation: 0,
          onMenuStateChange: (isOpen) {
            setState(() {
              isOpen ? dropDownAngle = 0 : dropDownAngle = -1.55;
            });
          },
          underline: Container(),
          alignment: Alignment.center,
          icon: Padding(
            padding: EdgeInsets.only(right: 18.h),
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) => Transform.rotate(
                angle: _animationController.value * dropDownAngle,
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColor.primaryColor,
                  size: 25.sp,
                ),
              ),
            ),
          ),
          // borderRadius: BorderRadius.circular(7.r),
          hint: Row(
            children: [
              SizedBox(
                width: 7.h,
              ),
              Icon(
                Icons.business,
                color: AppColor.primaryColor,
                size: 21,
              ),
              SizedBox(width: 11.w),
              Text(
                "Paramètres entreprise",
                style: TextStyle(color: AppColor.primaryColor, fontSize: 13.sp, fontWeight: FontWeight.w600)
                    .copyWith(fontFamily: "Poppins"),
              ),
            ],
          ),
          items: items
              .map((e) => DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        e.item2,
                        color: AppColor.primaryColor,
                        size: 21,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        e.item1,
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 13.sp, fontWeight: FontWeight.w600)
                            .copyWith(fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                  value: e.item1))
              .toList(),
          style: TextStyle(color: AppColor.primaryColor, fontSize: 13.sp, fontWeight: FontWeight.w600)
              .copyWith(fontFamily: "Poppins"),
          onChanged: (String? value) {
            if (value == 'Champs') {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 400),
                      type: PageTransitionType.rightToLeftWithFade,
                      child: MainCreateFields(enterpriseUid: widget.uid)));
            } else if (value == 'Employer') {
              Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 400),
                      type: PageTransitionType.rightToLeftWithFade,
                      child: MainEnterpriseEmploye(enterpriseUid: widget.uid)));
            }
          },
        ),
      ),
    );
  }
}
