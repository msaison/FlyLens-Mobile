// ignore_for_file: diagnostic_describe_all_properties

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/components/weather_show.dart';
import 'package:flylens/config.dart';

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
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 70.h,
              ),
              SizedBox(height: 37.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Dashboard',
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Container(
                      height: 36,
                      color: AppColor.lightprimaryColor,
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Météo',
                        style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    const WeatherShow(),
                    const SizedBox(height: 20),
                    const WeatherShow(
                      latitude: -41.286460,
                      longitude: 174.776236,
                    ),
                    const SizedBox(height: 20),
                    const WeatherShow(
                      latitude: 70.47233000,
                      longitude: -68.58987000,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
