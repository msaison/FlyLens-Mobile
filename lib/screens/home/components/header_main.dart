import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../config.dart';

class HeaderMain extends StatefulWidget {
  const HeaderMain({Key? key}) : super(key: key);

  @override
  State<HeaderMain> createState() => _HeaderMainState();
}

class _HeaderMainState extends State<HeaderMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70.h,
      child: Row(
        children: [
          SizedBox(width: 15.w),
          SvgPicture.asset('assets/svg/logo.svg', width: 40, height: 40, color: AppColor.primaryColor,),
        ],
      ),
    );
  }
}
