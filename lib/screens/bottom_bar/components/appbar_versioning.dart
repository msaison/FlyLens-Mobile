import 'package:flutter/material.dart';
import 'package:flylens/screens/bottom_bar/components/appbarv0.dart';
import 'package:flylens/screens/bottom_bar/components/appbarv2.dart';
import 'package:flylens/screens/bottom_bar/components/appbarv3.dart';

enum AppBarVersion { V0, V1, V2, V3 }

Widget whatAppBar({required AppBarVersion appBarVersion, required List<Widget> pagelist}) {
  if (appBarVersion == AppBarVersion.V0) {
    return AppBarV0(pagelist: pagelist);
  } else if (appBarVersion == AppBarVersion.V2) {
    return AppBarV2(pagelist: pagelist);
  } else if (appBarVersion == AppBarVersion.V3) {
    return AppBarV3(pagelist: pagelist);
  } else {
    return Container();
  }
}
