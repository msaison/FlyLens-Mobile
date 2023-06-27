import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../api.dart';
import '../../../../components/button.dart';
import '../../../../components/header.dart';
import '../../../../config.dart';
import '../../../qr_code/qr_code_main.dart';
import '../custom_cellules.dart';
import 'package:page_transition/page_transition.dart';

class MainEnterpriseEmploye extends StatefulWidget {
  final String enterpriseUid;
  const MainEnterpriseEmploye({required this.enterpriseUid, Key? key}) : super(key: key);

  @override
  State<MainEnterpriseEmploye> createState() => _MainEnterpriseEmployeState();
}

class _MainEnterpriseEmployeState extends State<MainEnterpriseEmploye> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            invertColor: true,
            onTapBackButton: () => Navigator.pop(context),
            titleSize: 20.sp,
            title: 'Employés',
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(height: 1.h, color: AppColor.primaryColor.withOpacity(0.1)),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Button(
              textButton: 'Ajouter un membre.',
              onTap: () => Navigator.of(context).push(PageTransition(
                  child: QrCodeMain(
                    companyCode: widget.enterpriseUid,
                  ),
                  type: PageTransitionType.rightToLeft)),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: FutureBuilder(
                  future: getUserIdsFromEnterprisesDocument(widget.enterpriseUid),
                  builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: EmployerCellule(
                                text: '${snapshot.data![index]['nom']} ${snapshot.data![index]['prenom']}',
                                firstIcon: Icons.phone_android_rounded,
                                firstTap: () => print('phone'),
                                secondIcon: Icons.person_remove_rounded,
                                secondTap: () async {
                                  await removeCrossReferences(snapshot.data![index].id, widget.enterpriseUid);
                                  setState(() {});
                                }),
                          );
                          // Text(
                          //   snapshot.data![index].data().toString(),
                          // );
                        },
                      );
                    } else {
                      return Center(
                        child: SpinKitWave(
                          color: Color.fromARGB(255, 53, 158, 81),
                          size: 20,
                        ),
                      );
                    }
                  })
              // Column(
              //   children: [
              //     EmployerCellule(firstIcon: Icons.phone, text: 'Name', secondIcon: Icons.delete,),
              //   ],
              // ),
              ),
        ],
      ),
    );
  }
}
