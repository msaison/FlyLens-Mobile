import 'package:flutter/material.dart';
import 'dart:math';

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
