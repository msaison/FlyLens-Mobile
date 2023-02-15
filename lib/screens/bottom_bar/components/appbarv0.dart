import 'package:animations/animations.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flylens/config.dart';
import 'package:iconsax/iconsax.dart';


class AppBarV0 extends StatefulWidget {
  final List<Widget> pagelist;

  const AppBarV0({required this.pagelist, Key? key}) : super(key: key);

  @override
  State<AppBarV0> createState() => _AppBarV0State();
}

class _AppBarV0State extends State<AppBarV0> {
  int idx = 0;

  void _changePage(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: SizedBox(
      //   height: 50,
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     onPressed: () => Navigator.of(context).push(
      //       PageTransition(child: MainCreateFields(), type: PageTransitionType.rightToLeft),
      //     ),
      //     child: Icon(
      //       Iconsax.add,
      //       size: 29,
      //       color: AppColor.primaryColor,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: FloatingNavbar(
          backgroundColor: AppColor.primaryColor,
          selectedItemColor: Colors.white,
          selectedBackgroundColor: Color(0xff4BA163),
          borderRadius: 25,
          itemBorderRadius: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.only(bottom: 15, top: 15),
          items: [
            FloatingNavbarItem(icon: Iconsax.home),
            FloatingNavbarItem(icon: Iconsax.location),
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
        child: widget.pagelist[idx],
      ),
    );
  }
}