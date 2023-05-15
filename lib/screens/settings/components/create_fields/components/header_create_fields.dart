import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../components/header.dart';
import '../../../../../config.dart';

class HeaderCreateFields extends StatefulWidget {
  final bool onEditing;
  final int onEditingPointNumber;

  const HeaderCreateFields({this.onEditing = false, this.onEditingPointNumber = 0, Key? key}) : super(key: key);

  @override
  State<HeaderCreateFields> createState() => _HeaderCreateFieldsState();
}

class _HeaderCreateFieldsState extends State<HeaderCreateFields> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0,
                0.1,
                0.4,
                1,
              ],
              colors: [
                AppColor.primaryColor,
                AppColor.primaryColor.withOpacity(0.90),
                AppColor.primaryColor.withOpacity(0.70),
                AppColor.primaryColor.withOpacity(0.01),
              ],
            ))),
       widget.onEditing
            ? Padding(
              padding: EdgeInsets.only(top: 120.h, left: 20.w, right: 20.w),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Vous avez besoin d'au moins 4 points pour validé ${widget.onEditingPointNumber} / 4",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: widget.onEditingPointNumber >= 4 ? Colors.green : Colors.red,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
            : SizedBox(),
        !widget.onEditing
            ? Header(
                title: 'Appuyez sur le + pour créer un nouveau champ.',
                onTapBackButton: () => Navigator.pop(context),
              )
            : Header(
                title: 'Ajoutez les points necessaire pour tracer votre champ.',
              ),
      ],
    );
  }
}
