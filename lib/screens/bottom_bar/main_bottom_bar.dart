import 'package:animations/animations.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flylens/config.dart';
import 'package:flylens/screens/create_fields/main_create_fields.dart';
import 'package:flylens/screens/home/home_main.dart';
import 'package:flylens/screens/maps/maps_main.dart';
import 'package:flylens/screens/settings/settings_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({Key? key}) : super(key: key);

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int idx = 0;

  void _changePage(int index) {
    setState(() {
      idx = index;
    });
  }

  final List<Widget> _pageList = [
    HomeMain(),
    MapsMain(),
    Container(),
    SettingsMain(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: () => Navigator.of(context).push(
            PageTransition(child: MainCreateFields(), type: PageTransitionType.rightToLeft),
          ),
          child: Icon(
            Iconsax.add,
            size: 29,
            color: AppColor.primaryColor,
          ),
        ),
      ),
      bottomNavigationBar: FloatingNavbar(
          backgroundColor: AppColor.primaryColor,
          selectedItemColor: Colors.white,
          selectedBackgroundColor: Color(0xff4BA163),
          borderRadius: 25,
          itemBorderRadius: 100,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          items: [
            FloatingNavbarItem(icon: Iconsax.home),
            FloatingNavbarItem(icon: Iconsax.location),
            FloatingNavbarItem(icon: Iconsax.game),
            FloatingNavbarItem(icon: Iconsax.setting_3)
          ],
          currentIndex: idx,
          onTap: (_) => _changePage(_)),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pageList[idx],
      ),
    );
  }
}