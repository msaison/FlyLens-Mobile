// ignore_for_file: diagnostic_describe_all_properties

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/Models/fields/fields_model.dart';
import 'package:flylens/config.dart';
import 'package:flylens/helper.dart';
import 'package:flylens/screens/home/components/analyse_main.dart';
import 'package:flylens/screens/home/components/field_tag.dart';
import 'package:flylens/screens/home/components/header_main.dart';
import 'package:flylens/screens/home/components/weather_main.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: FutureBuilder(
            future: getAllFieldsWithUserId(FirebaseAuth.instance.currentUser!.uid),
            builder: (context, AsyncSnapshot<List<FieldsModel>?> snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: Column(
                    children: [
                      HeaderMain(),
                      SizedBox(height: 37.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Dashboard',
                                style: TextStyle(
                                    color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 17.h),
                            FieldTagMain(
                              fieldLists: snapshot.data!,
                            ),
                            SizedBox(height: 24.h),
                            WeatherMain(),
                            SizedBox(height: 24.h),
                            AnalyseMain(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }));

    // ));
  }
}
