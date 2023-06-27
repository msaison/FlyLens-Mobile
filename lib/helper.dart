
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timeago_flutter/timeago_flutter.dart';


extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$");
    return passwordRegExp.hasMatch(this);
  }

  bool get isStrongPassword {
    final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this.isNotEmpty;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isNonDigit {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(this);
  }
}

extension extStringNull on String? {
  bool get isValidPasswordNull {
    if (this != null) {
      final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
      return passwordRegExp.hasMatch(this!);
    } else {
      return false;
    }
  }
}

Widget inkWell({
  VoidCallback? onTap,
  BorderRadius borderRadius = BorderRadius.zero,
  EdgeInsetsGeometry padding = EdgeInsets.zero,
  BoxConstraints? constraints,
  Key? key,
  Color? splashColor,
  Color? highlightColor,
  required Decoration decoration,
  required Widget child,
}) =>
    Container(
      key: key,
      decoration: decoration,
      constraints: constraints,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          highlightColor: highlightColor,
          splashColor: splashColor,
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );

const _chars = '1234567890';
Random _rnd = Random();

String getRandomCode(int length) =>
    String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class FrMessagesCustom implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => "";
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => "$seconds secondes";
  @override
  String aboutAMinute(int minutes) => '1 minutes';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => '1 heures';
  @override
  String hours(int hours) => '$hours heures';
  @override
  String aDay(int hours) => '1 jours';
  @override
  String days(int days) => '$days jours';
  @override
  String aboutAMonth(int days) => '1 minutes';
  @override
  String months(int months) => '$months minutes';
  @override
  String aboutAYear(int year) => '1 an';
  @override
  String years(int years) => '$years ans';
  @override
  String wordSeparator() => ' ';
}
