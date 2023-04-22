import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config.dart';

class AnalyseMain extends StatefulWidget {
  const AnalyseMain({Key? key}) : super(key: key);

  @override
  State<AnalyseMain> createState() => _AnalyseMainState();
}

class _AnalyseMainState extends State<AnalyseMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Analyses',
            style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
