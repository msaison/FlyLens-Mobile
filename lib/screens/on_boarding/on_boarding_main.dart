import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/button.dart';
import '../../config.dart';
import '../auth/login/login_main.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingMain extends StatefulWidget {
  final List<OnBoardingGenerator> onBoardingGenerator;
  const OnBoardingMain({required this.onBoardingGenerator, Key? key}) : super(key: key);

  @override
  State<OnBoardingMain> createState() => _OnBoardingMainState();
}

class _OnBoardingMainState extends State<OnBoardingMain> {
  int index = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 11.w, top: 33.h, right: 23.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              index == 0 ? SizedBox() : BackButtonUpdated(),
              index == widget.onBoardingGenerator.length - 1
                  ? SizedBox()
                  : TextButtonUpdated(
                      clicktextButton: 'Passer',
                      textClickStyle: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: PageView(
            physics: BouncingScrollPhysics(),
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            children: List.generate(widget.onBoardingGenerator.length, (_) {
              return Column(
                children: [
                  widget.onBoardingGenerator[_].illustration,
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 49.w),
                    child: Column(
                      children: [
                        Text(
                          widget.onBoardingGenerator[_].title ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColor.primaryColor, fontSize: 24.sp, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          widget.onBoardingGenerator[_].subTitle ?? '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColor.primaryColor.withOpacity(0.6),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(widget.onBoardingGenerator.length, ((_) {
                    return Padding(
                      padding: EdgeInsets.only(left: _ != 0 ? 3.w : 0),
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _ ? AppColor.primaryColor : AppColor.primaryColor.withOpacity(0.5)),
                      ),
                    );
                  })),
                ),
                SizedBox(height: 20.h),
                Button(
                  textButton: 'Suivant',
                  width: 152.w,
                  onTap: () {
                    if (widget.onBoardingGenerator.length == (index + 1)) {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 400),
                              type: PageTransitionType.rightToLeftWithFade,
                              child: LoginMain()));
                    } else {
                      pageController.animateToPage(index + 1,
                          duration: Duration(milliseconds: 500), curve: Curves.easeInBack);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

class OnBoardingGenerator {
  String? title;
  String? subTitle;
  Widget illustration;

  OnBoardingGenerator({
    this.title,
    this.subTitle,
    required this.illustration,
  });
}
