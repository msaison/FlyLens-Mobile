import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config.dart';
import 'form/form_company.dart';
import '../scan/scan_main.dart';
import 'package:page_transition/page_transition.dart';

class JoinOrCreateEnterprise extends StatefulWidget {
  const JoinOrCreateEnterprise({Key? key}) : super(key: key);

  @override
  State<JoinOrCreateEnterprise> createState() => _JoinOrCreateEnterpriseState();
}

class _JoinOrCreateEnterpriseState extends State<JoinOrCreateEnterprise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: InkWell(
            onTap: () =>
                Navigator.of(context).push(PageTransition(child: ScanMain(), type: PageTransitionType.rightToLeft)),
            child: Container(
                color: AppColor.primaryColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.store_rounded,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      Text(
                        "Rejoindre une entreprise.",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ],
                  ),
                )),
          )),
          Expanded(
              child: InkWell(
            onTap: () =>
                Navigator.of(context).push(PageTransition(child: FormCompany(), type: PageTransitionType.rightToLeft)),
            child: Container(
                color: AppColor.lightprimaryColor,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_business_rounded,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                      Text(
                        "Créer une entreprise.",
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                    ],
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
