import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/components/weather_show.dart';
import 'package:flylens/config.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key? key}) : super(key: key);

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
