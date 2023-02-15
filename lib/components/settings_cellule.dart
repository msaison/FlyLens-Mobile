import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config.dart';
import '../helper.dart';

class SettingsCellule extends StatefulWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String? text;
  final String? miniText;
  final bool withArrow;
  final Color? textAndIconColor;
  final Function(bool)? onSwitch;
  final String? svgIcon;
  final Uri? launchUri;

  const SettingsCellule(
      {this.onTap,
      this.icon,
      this.text,
      this.miniText,
      this.withArrow = true,
      this.textAndIconColor,
      this.onSwitch,
      this.svgIcon,
      this.launchUri,
      Key? key})
      : super(key: key);

  @override
  State<SettingsCellule> createState() => _SettingsCelluleState();
}

class _SettingsCelluleState extends State<SettingsCellule> {
  bool switchBool = false;

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: widget.launchUri != null ? () => launchURL(widget.launchUri!) : widget.onTap,
      constraints: BoxConstraints(minHeight: 55.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.svgIcon != null
                    ? SvgPicture.asset(
                        widget.svgIcon!,
                        fit: BoxFit.none,
                      )
                    : Icon(
                        widget.icon ?? Icons.block,
                        color: widget.textAndIconColor ?? AppColor.primaryColor,
                        size: 21,
                      ),
                SizedBox(width: 11.w),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  AutoSizeText(
                    widget.text ?? 'Compte bloqué',
                    style: TextStyle(
                        color: widget.textAndIconColor ?? AppColor.primaryColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  widget.miniText != null
                      ? Text(widget.miniText!,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: widget.textAndIconColor ?? AppColor.primaryColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400))
                      : SizedBox()
                ]),
              ],
            ),
            widget.onSwitch != null
                ? Switch.adaptive(
                    value: switchBool,
                    activeColor: AppColor.primaryColor,
                    onChanged: ((value) {
                      widget.onSwitch!(value);
                      setState(() {
                        switchBool = value;
                      });
                    }),
                  )
                : widget.withArrow
                    ? Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.primaryColor,
                        size: 16,
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}

void launchURL(Uri uri) async => await canLaunchUrl(uri) ? await launchUrl(uri) : throw 'Could not launch ${uri.data}';
