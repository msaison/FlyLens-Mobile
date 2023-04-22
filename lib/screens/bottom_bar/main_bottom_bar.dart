import 'package:flutter/material.dart';

import '../home/home_main.dart';
import '../maps/maps_main.dart';
import '../settings/settings_main.dart';
import 'components/appbar_versioning.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({Key? key}) : super(key: key);

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  final List<Widget> _pageList = [
    HomeMain(),
    MapsMain(),
    SettingsMain(),
  ];

  @override
  Widget build(BuildContext context) {
    return whatAppBar(appBarVersion: AppBarVersion.V3, pagelist: _pageList);
  }
}
