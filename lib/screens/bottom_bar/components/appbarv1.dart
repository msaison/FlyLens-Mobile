import 'package:animations/animations.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flylens/config.dart';
import 'package:flylens/screens/create_fields/main_create_fields.dart';
import 'package:iconsax/iconsax.dart';
import 'package:page_transition/page_transition.dart';

class AppBarV1 extends StatefulWidget {
  final List<Widget> pagelist;

  const AppBarV1({required this.pagelist, Key? key}) : super(key: key);

  @override
  State<AppBarV1> createState() => _AppBarV1State();
}

class _AppBarV1State extends State<AppBarV1> {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
      bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          hasNotch: true,
          backgroundColor: AppColor.primaryColor,
          fabLocation: BubbleBottomBarFabLocation.end,
          tilesPadding: const EdgeInsets.only(bottom: 15, top: 15),
          items: [
            BubbleBottomBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Iconsax.home),
              activeIcon: Icon(Iconsax.home),
              title: Text("Accueil"),
            ),
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Iconsax.location),
                activeIcon: Icon(Iconsax.location),
                showBadge: true,
                title: Text("Informations")),
            BubbleBottomBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Iconsax.setting_3),
                activeIcon: Icon(Iconsax.setting_3),
                title: Text("Paramètres")),
          ],
          currentIndex: idx,
          onTap: (_) => _changePage(_!)),
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
