import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../fnav/fbutton.dart';
import '../fnav/fnav.dart';
import 'package:iconsax/iconsax.dart';

class AppBarV3 extends StatefulWidget {
  final List<Widget> pagelist;

  const AppBarV3({required this.pagelist, Key? key}) : super(key: key);

  @override
  State<AppBarV3> createState() => _AppBarV3State();
}

class _AppBarV3State extends State<AppBarV3> {
  int idx = 0;

  void _changePage(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageTransitionSwitcher(
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
          FNav(
            tabs: [
              FButton(
                iconData: Iconsax.home_1,
                iconBehind: Iconsax.home_11,
                text: 'Accueil',
              ),
              FButton(
                iconData: Iconsax.location4,
                iconBehind: Iconsax.location5,
                text: 'Infos',
              ),
              FButton(
                iconData: Iconsax.setting_2,
                iconBehind: Iconsax.setting_2,
                text: 'Params',
              ),
            ],
            onTabChange: _changePage,
          )
        ],
      ),
    );
  }
}
