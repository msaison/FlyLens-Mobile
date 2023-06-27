import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens/home/home_main.dart';
import 'helper.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import 'screens/auth/join_or_create_enterprise.dart';
import 'config.dart';
import 'handle_auth.dart';
import 'screens/auth/form/form_user.dart';
import 'package:flutter/material.dart';
import 'screens/on_boarding/on_boarding_main.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../api.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setLocaleMessages('fr', FrMessagesCustom());

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const ProviderScope(child: MyApp()));
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
                localizationsDelegates: <LocalizationsDelegate<Object>>[
                  GlobalMaterialLocalizations.delegate,
                ],
                supportedLocales: [const Locale('fr')],
                home: Builder(
                  builder: (context) => FutureBuilder(
                      future: handleAuth(
                        redirections: {
                          COLLECTION_USER: RedirectionHandle(
                              homePage: HomeMain(),
                              normalRegister: FormUser(),
                              socialRegister: FormUser(),
                              entreprise: JoinOrCreateEnterprise()),
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
                              // AppColor.primaryColor,
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
