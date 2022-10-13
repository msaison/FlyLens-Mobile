import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flylens/screens/settings/components/custom_cellules.dart';
import '../../Models/user/user_model.dart';
import '../../components/settings_cellule.dart';
import '../../config.dart';
import '../../main.dart';

class SettingsMain extends StatefulWidget {
  const SettingsMain({Key? key}) : super(key: key);

  @override
  State<SettingsMain> createState() => _SettingsMainState();
}

class _SettingsMainState extends State<SettingsMain> {
  bool loading = true;

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
                                  : SizedBox()
                            ],
                          ),
                          SizedBox(height: 25.h),
                          Container(
                              height: 0.5, width: double.infinity, color: AppColor.primaryColor.withOpacity(0.14)),
                          SingleChildScrollView(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              SettingsCellule(
                                icon: Icons.business_center_rounded,
                                text: 'Votre entreprise',
                                miniText: 'Gestion employer, Gestion drone, Gestion champs, ect...',
                                onTap: () {
                                  print('gestion');
                                },
                              ),
                              user.enterprise == null
                                  ? CreateAnEnterprise()
                                  : (user.enterprise!.length > 0)
                                      ? SizedBox()
                                      : CreateAnEnterprise(),
                              SizedBox(height: 11.h),
                              user.enterprise == null
                                  ? JoinAnEnterprise()
                                  : (user.enterprise!.length > 0)
                                      ? SizedBox()
                                      : JoinAnEnterprise(),
                              user.enterprise != null
                                  ? (user.enterprise!.length > 0)
                                      ? InviteAnEmploye(user: user)
                                      : SizedBox()
                                  : SizedBox(),
                              SizedBox(height: 11.h),
                              SettingsCellule(
                                onTap: () async {
                                  loading = true;
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (_) => MyApp()), (route) => false);
                                },
                                withArrow: false,
                                text: 'Se déconnecter',
                                textAndIconColor: Colors.red,
                                icon: Icons.logout_rounded,
                              ),
                            ]),
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
