import 'package:flutter/material.dart';

//////////////////////////////////////////////////////////////////////////////
//////////////////////////        APP CORE        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

const MULTIPLE_ACCOUNT_TYPE = false;

const SERVER = 'dev';

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
/////////////////////////        APP THEME        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

abstract class AppTheme {
  static InputDecoration inputDecoration({
    String? hintText,
  }) =>
      InputDecoration(
          errorStyle: const TextStyle(fontSize: 12, height: 0),
          filled: true,
          fillColor: const Color(0xFF02132B).withOpacity(0.03),
          contentPadding: const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: AppColor.errorColor,
                width: 0.5,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: AppColor.errorColor,
                width: 0.5,
              )),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
          hintText: hintText ?? "Placeholder",
          hintStyle: const TextStyle(color: Color(0xFF9299A4), fontSize: 13, fontWeight: FontWeight.w500));
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
/////////////////////////        APP COLOR        ////////////////////////////
//////////////////////////////////////////////////////////////////////////////

abstract class AppColor {
  static Color backgroundColor = Color(0xFFF3F0EF);
  static Color lightprimaryColor = Color(0xFF4CA063);
  static Color primaryColor = Color(0xFF033323);
  static Color darkprimaryColor = Color.fromARGB(255, 1, 23, 16);
  static Color fiveColor = Color.fromARGB(255, 232, 227, 223);
  static Color errorColor = Color(0xFFFF3333);
  static Color successColor = Colors.green;
}

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////