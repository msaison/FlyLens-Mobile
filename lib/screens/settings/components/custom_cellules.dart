import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/settings_cellule.dart';
import '../../../config.dart';
import '../../auth/form/form_company.dart';
import '../../qr_code/qr_code_main.dart';
import '../../scan/scan_main.dart';
import 'package:page_transition/page_transition.dart';

class InviteAnEmploye extends StatelessWidget {
  const InviteAnEmploye({
    Key? key,
  }) : super(key: key);

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
                    companyCode: '',
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


class EmployerCellule extends StatelessWidget {
  final ImageProvider? image;
  final String text;
  final IconData firstIcon;
  final IconData? secondIcon;
  final VoidCallback? firstTap;
  final VoidCallback? secondTap;
  final Color? firstIconColor;

  const EmployerCellule(
      {this.image,
      required this.text,
      required this.firstIcon,
      this.firstTap,
      this.secondIcon,
      this.secondTap,
      this.firstIconColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 60.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                image != null
                    ? Image(
                        image: NetworkImage(''),
                        height: 37.h,
                        width: 37.w,
                      )
                    : SizedBox(),
                SizedBox(width: 11.w),
                AutoSizeText(
                  text,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  iconSize: 24.sp,
                  splashRadius: 20.h,
                  icon: Icon(
                    firstIcon,
                    color: firstIconColor ?? AppColor.primaryColor,
                    size: 24.sp,
                  ),
                  onPressed: firstTap,
                ),
                secondIcon != null
                    ? Container(width: 1.w, height: 30.h, color: AppColor.primaryColor.withOpacity(0.2))
                    : SizedBox(),
                secondIcon != null
                    ? IconButton(
                        iconSize: 24.sp,
                        splashRadius: 20.h,
                        icon: Icon(
                          secondIcon,
                          color: AppColor.errorColor,
                          size: 24.sp,
                        ),
                        onPressed: secondTap,
                      )
                    : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
