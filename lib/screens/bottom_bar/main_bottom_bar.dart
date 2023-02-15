import 'package:flutter/material.dart';
import 'package:flylens/screens/bottom_bar/components/appbar_versioning.dart';
import 'package:flylens/screens/home/home_main.dart';
import 'package:flylens/screens/maps/maps_main.dart';
import 'package:flylens/screens/settings/settings_main.dart';

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
