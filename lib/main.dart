import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/screens/create_fields/main_create_fields.dart';
import 'package:flylens/screens/maps/maps_main.dart';
import 'package:flylens/screens/home/home_main.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyAppWithBottomBar());

class MyAppWithBottomBar extends StatefulWidget {
  const MyAppWithBottomBar({Key? key}) : super(key: key);

  @override
  State<MyAppWithBottomBar> createState() => _MyAppWithBottomBarState();
}

class _MyAppWithBottomBarState extends State<MyAppWithBottomBar> {
  int idx = 0;

  void _changePage(int index) {
    setState(() {
      idx = index;
    });
  }

  final List<Widget> _pageList = [HomeMain(), MapsMain(), Container(), HomeMain()];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (ctx, wdgt) => GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: MaterialApp(
                  theme: ThemeData(fontFamily: 'Poppins'),
                  home: Builder(
                    builder: (context) => Scaffold(
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
                            color: Color(0xff033323),
                          ),
                        ),
                      ),
                      bottomNavigationBar: FloatingNavbar(
                          backgroundColor: Color(0xff033323),
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
                    ),
                  )),
            ));
  }
}
