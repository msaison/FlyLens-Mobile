import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/Models/user/user_model.dart';
import 'package:flylens/components/settings_cellule.dart';
import 'package:flylens/config.dart';
import 'package:flylens/screens/auth/form/form_company.dart';
import 'package:flylens/screens/qr_code/qr_code_main.dart';
import 'package:flylens/screens/scan/scan_main.dart';
import 'package:page_transition/page_transition.dart';

class InviteAnEmploye extends StatelessWidget {
  const InviteAnEmploye({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 11.h),
        SettingsCellule(
          text: 'Invitez un employer dans votre entreprise',
          icon: Icons.domain_add_rounded,
          textAndIconColor: AppColor.primaryColor,
          withArrow: true,
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                  child: QrCodeMain(
                    companyCode: user.enterprise != null ? user.enterprise!.first : '',
                  ),
                  type: PageTransitionType.rightToLeft),
            );
          },
        ),
      ],
    );
  }
}

class CreateAnEnterprise extends StatelessWidget {
  const CreateAnEnterprise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 11.h),
        SettingsCellule(
          text: 'Créer une entreprise',
          icon: Icons.add_business_rounded,
          textAndIconColor: AppColor.primaryColor,
          onTap: () {
            Navigator.of(context).push(
              PageTransition(child: FormCompany(), type: PageTransitionType.rightToLeft),
            );
          },
        ),
      ],
    );
  }
}

class JoinAnEnterprise extends StatelessWidget {
  const JoinAnEnterprise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsCellule(
      onTap: () async {
        Navigator.of(context).push(
          PageTransition(child: ScanMain(), type: PageTransitionType.rightToLeft),
        );
      },
      text: 'Rejoindre une entreprise',
      textAndIconColor: AppColor.primaryColor,
      icon: Icons.domain_add_rounded,
    );
  }
}

class ModifYourEnterprise extends StatelessWidget {
  const ModifYourEnterprise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsCellule(
      icon: Icons.business_center_rounded,
      text: 'Votre entreprise',
      miniText: 'Gestion employer, Gestion drone, Gestion champs, ect...',
      onTap: () {
        print('gestion');
      },
    );
  }
}
