import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget alertToast({required String message, bool success = false}) {
  return Center(
    child: Container(
      height: 70.h,
      decoration: BoxDecoration(
          color: success ? Color(0xFFEBFBF4) : Color(0xFFFCEDEF),
          // backgroundBlendMode: BlendMode.saturation,
          borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 18, 20, 21),
        child: Row(children: [
          Icon(
            success ? Icons.check_circle_rounded : Icons.error_rounded,
            color: success ? Color(0xFF34D39D) : Color(0xFFF04C61),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 11.sp),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ]),
      ),
    ),
  );
}

// "An item in you're cart is sold out. Please remove it to continue. This is a too much messages."