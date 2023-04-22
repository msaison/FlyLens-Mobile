import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';


class AppBarV2 extends StatefulWidget {
  final List<Widget> pagelist;

  const AppBarV2({required this.pagelist, Key? key}) : super(key: key);

  @override
  State<AppBarV2> createState() => _AppBarV2State();
}

class _AppBarV2State extends State<AppBarV2> {
  int idx = 0;

  void _changePage(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: GNav(
              // rippleColor: Colors.grey[300]!,
              rippleColor: AppColor.lightprimaryColor.withOpacity(0.4),
              gap: 8,
              activeColor: Colors.white,
              iconSize: 18,
              textSize: 4,
              textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              tabs: [
                GButton(
                  icon: Iconsax.home_1,
                  text: 'Accueil',
                  iconColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  backgroundGradient:
                      LinearGradient(colors: [AppColor.lightprimaryColor, AppColor.lightprimaryColor.withOpacity(0.5)]),
                ),
                GButton(
                  icon: Iconsax.location4,
                  text: 'Informations',
                  iconColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  backgroundGradient:
                      LinearGradient(colors: [AppColor.lightprimaryColor, AppColor.lightprimaryColor.withOpacity(0.5)]),
                ),
                GButton(
                  icon: Iconsax.setting_2,
                  text: 'Paramètres',
                  textSize: 5,
                  iconColor: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  backgroundGradient:
                      LinearGradient(colors: [AppColor.lightprimaryColor, AppColor.lightprimaryColor.withOpacity(0.5)]),
                ),
              ],
              selectedIndex: idx,
              onTabChange: _changePage),
        ),
      ),
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

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('GoogleNavBar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.heart_broken_sharp,
                  text: 'Likes',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.verified_user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
