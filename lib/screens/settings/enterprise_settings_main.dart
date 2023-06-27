import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/header.dart';
import 'components/entreprise_utils/create_fields/main_create_fields.dart';
import 'components/entreprise_utils/main_appointment.dart';
import 'components/entreprise_utils/main_entreprise_employe.dart';
import 'components/entreprise_utils/main_upload_picture.dart';
import '../../components/settings_cellule.dart';
import '../../config.dart';
import 'package:page_transition/page_transition.dart';

class EnterpriseSettingsMain extends StatefulWidget {
  final String uid;
  const EnterpriseSettingsMain({Key? key, required this.uid}) : super(key: key);

  @override
  State<EnterpriseSettingsMain> createState() => _EnterpriseSettingsMainState();
}

class _EnterpriseSettingsMainState extends State<EnterpriseSettingsMain> {
  bool loading = true;
  bool notif = false;
  String value = "Entreprise params";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Header(
                invertColor: true,
                title: 'Paramètres entreprise',
                titleSize: 18.sp,
                titleWeight: FontWeight.w500,
                onTapBackButton: () => Navigator.pop(context),
              ),
              SizedBox(height: 25.h),
              Container(height: 0.5, width: double.infinity, color: AppColor.primaryColor.withOpacity(0.14)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                child: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(height: 11.h),
                    SettingsCellule(
                      text: "Vos employés",
                      miniText: 'Supprimez, contactez ou ajoutez des employés',
                      icon: Icons.people_alt_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.rightToLeftWithFade,
                                child: MainEnterpriseEmploye(enterpriseUid: widget.uid)));
                      },
                    ),
                    SizedBox(height: 11.h),
                    SettingsCellule(
                      text: "Vos champs",
                      miniText: 'Supprimez, modifiez ou ajoutez des champs',
                      icon: Icons.grass_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.rightToLeftWithFade,
                                child: MainCreateFields(enterpriseUid: widget.uid)));
                      },
                    ),
                    SizedBox(height: 11.h),
                    SettingsCellule(
                      text: 'Demandes de rendez-vous',
                      miniText: 'Séléctionnez une date et un horaire',
                      icon: Icons.schedule_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.rightToLeftWithFade,
                                child: MainAppointment(uid: widget.uid,)));
                      },
                    ),
                    SizedBox(height: 11.h),
                    SettingsCellule(
                      text: 'Envoyé des photos en analyse',
                      miniText: 'Séléctionnez les photos à analyser',
                      icon: Icons.add_a_photo_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 400),
                                type: PageTransitionType.rightToLeftWithFade,
                                child: UploadPictureMain(uid: widget.uid,)));
                      },
                    ),
                    SizedBox(height: 11.h),
                    SettingsCellule(
                      onTap: () async {
                      },
                      withArrow: false,
                      text: 'Supprimer cette entreprise',
                      textAndIconColor: Colors.red,
                      icon: Icons.logout_rounded,
                    ),
                    SizedBox(height: 100.h)
                  ]),
                ),
              )
            ])));
  }
}
