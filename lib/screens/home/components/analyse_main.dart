import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Models/analyse/analyse_model.dart' show HealthyLeaf, UnhealthyLeaf;
import '../../../components/gallery_image/galleryimage.dart';
import '../../../components/button.dart';
import '../../../components/providers/analyses.dart';
import '../../../api.dart';
import 'package:timeago_flutter/timeago_flutter.dart';
import '../../../config.dart';

class AnalyseMain extends ConsumerStatefulWidget {
  final String? fieldID;
  final String companyID;
  const AnalyseMain({this.fieldID, required this.companyID, Key? key}) : super(key: key);

  @override
  ConsumerState<AnalyseMain> createState() => _AnalyseMainState();
}

class _AnalyseMainState extends ConsumerState<AnalyseMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(
                'Analyses',
                style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              BackButtonUpdated(iconData: Icons.refresh_rounded, size: 36, onTap: () => setState(() {}))
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: FutureBuilder(
            future: fetchAnalysisStats(companyId: widget.companyID, fieldId: widget.fieldID, ref: ref),
            builder: (context, AsyncSnapshot<AnalyseGlobal?> snapshot) {
              double size = (MediaQuery.of(context).size.width / 2 - 35) - 10;
              if (snapshot.hasData && snapshot.data != null) {
                HealthyLeaf? healthy = snapshot.data!.analyseModel.classes_stats.healthyleaf;
                UnhealthyLeaf? unhealthy = snapshot.data!.analyseModel.classes_stats.unhealthyLeaf;
                return analyse(size, snapshot, healthy, unhealthy);
              } else {
                return Center(
                  child: Text("Aucune analyse(s) détécter."),
                );
              }
            },
          ),
        ),
        FutureBuilder(
          future: fetchImageFields(widget.fieldID, widget.companyID),
          builder: (context, AsyncSnapshot<List<String>?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return GalleryImage(
                imageUrls: snapshot.data!,
                numOfShowImages: snapshot.data!.length < 3 ? snapshot.data!.length : 3,
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget analyse(double size, AsyncSnapshot<AnalyseGlobal?> snapshot, HealthyLeaf? healthy, UnhealthyLeaf? unhealthy) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            AnalyseCard(
                size: size,
                icon: Icons.watch_later_rounded,
                middle: Timeago(
                    date: snapshot.data!.lastRefresh,
                    locale: 'fr',
                    allowFromNow: true,
                    refreshRate: Duration(seconds: 10),
                    builder: (_, value) => Time(
                          time: value,
                          colorText: Colors.black,
                        ))),
            SizedBox(height: 15.h),
            AnalyseCard(
                size: size,
                icon: Icons.sentiment_very_dissatisfied_rounded,
                bigCard: true,
                backgroundColor: AppColor.primaryColor,
                textColor: Colors.white,
                middle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      unhealthy != null ? unhealthy.count.toString() : '0',
                      style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Feuille avec un problème potientiel',
                      style: TextStyle(color: Colors.white54, fontSize: 13.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      unhealthy != null ? '${(unhealthy.mean * 100).toStringAsFixed(1)}% de sûreté.' : '0% de sûreté.',
                      style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                )),
          ],
        ),
        Column(
          children: [
            AnalyseCard(
                size: size,
                icon: Icons.emoji_emotions_rounded,
                bigCard: true,
                backgroundColor: AppColor.primaryColor,
                textColor: Colors.white,
                middle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      healthy != null ? healthy.count.toString() : '0',
                      style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Feuille en bonne santé',
                      style: TextStyle(color: Colors.white54, fontSize: 13.sp),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      healthy != null ? '${(healthy.mean * 100).toStringAsFixed(1)}% de sûreté.' : '0% de sûreté.',
                      style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                )),
            SizedBox(height: 15.h),
            AnalyseCard(
                size: size,
                icon: Icons.percent_rounded,
                middle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (snapshot.data!.analyseModel.health_score * 100).toStringAsFixed(1),
                      style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Santé global',
                      style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class Time extends StatelessWidget {
  final String time;
  final Color colorText;
  const Time({required this.time, required this.colorText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          time.substring(0, time.indexOf(' ')),
          style: TextStyle(
            color: colorText,
            fontSize: 36.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          time.substring(time.indexOf(' ') + 1),
          style: TextStyle(
            color: colorText.withOpacity(0.54),
            fontSize: 16.sp,
            // fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class AnalyseCard extends StatefulWidget {
  final double size;
  final Widget middle;
  final IconData icon;
  final bool bigCard;
  final Color? backgroundColor;
  final Color? textColor;
  const AnalyseCard(
      {required this.size,
      required this.middle,
      required this.icon,
      this.bigCard = false,
      this.backgroundColor,
      this.textColor,
      Key? key})
      : super(key: key);

  @override
  State<AnalyseCard> createState() => _AnalyseCardState();
}

class _AnalyseCardState extends State<AnalyseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size + (widget.bigCard ? 40.h : 0),
      decoration: BoxDecoration(
          color: widget.backgroundColor != null ? widget.backgroundColor : Color(0xffB8F1B0),
          borderRadius: BorderRadius.circular(14.r)),
      child: Padding(
        padding: EdgeInsets.all(10.0.h),
        child: Stack(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 24.sp,
                    color: widget.textColor != null ? widget.textColor : Colors.black,
                  ),
                  widget.middle,
                ]),
            // Text(snapshot.data.)
          ],
        ),
      ),
    );
  }
}
