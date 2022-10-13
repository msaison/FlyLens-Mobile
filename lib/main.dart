import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'config.dart';
import 'handle_auth.dart';
import 'screens/auth/form/form_user.dart';
import 'screens/create_fields/main_create_fields.dart';
import 'screens/maps/maps_main.dart';
import 'screens/home/home_main.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'screens/on_boarding/on_boarding_main.dart';
import 'screens/settings/settings_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animations/animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                debugShowCheckedModeBanner: false,
                theme: ThemeData(fontFamily: 'Poppins', primaryColor: AppColor.primaryColor),
                home: Builder(
                  builder: (context) => FutureBuilder(
                      future: handleAuth(
                        redirections: {
                          COLLECTION_USER: RedirectionHandle(
                              homePage: MainUser(), normalRegister: FormUser(), socialRegister: FormUser()),
                        },
                        firstPage: Scaffold(
                          body: SpinKitHourGlass(color: AppColor.primaryColor),
                        ),
                        onBoarding: OnBoardingMain(onBoardingGenerator: onBoardingList),
                      ),
                      builder: (BuildContext context, AsyncSnapshot<Widget?> snapshot) {
                        if (snapshot.hasData) {
                          return Scaffold(
                            body: snapshot.data,
                          );
                        } else {
                          return Scaffold(
                            body: Center(
                                child: SpinKitWave(
                              color: AppColor.primaryColor,
                            )),
                          );
                        }
                      }),
                ),
              ),
            ));
  }
}

List<OnBoardingGenerator> onBoardingList = [
  OnBoardingGenerator(
    illustration: Container(),
    title: 'Lorem ipsum dolor sit amet, consectetur.',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed massa vel nisl suscipit euismod.',
  ),
  OnBoardingGenerator(
    illustration: Container(),
    title: 'Lorem ipsum dolor sit amet, consectetur.',
    subTitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed massa vel nisl suscipit euismod.',
  )
];

class MainUser extends StatefulWidget {
  const MainUser({Key? key}) : super(key: key);

  @override
  State<MainUser> createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
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
