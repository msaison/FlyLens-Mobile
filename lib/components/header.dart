import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config.dart';

class Header extends StatelessWidget {
  final Color backgroundBackButton;
  final Color backgroundIconButton;
  final double borderRadiusBackButton;
  final VoidCallback? onTapBackButton;
  final VoidCallback? onTapIcon;
  final EdgeInsets? titlePadding;
  final Icon? customIcon;
  final bool hasTitle;
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final Color? iconBackButtonColor;
  final bool invertColor;
  const Header(
      {this.backgroundBackButton = Colors.white,
      this.backgroundIconButton = Colors.white,
      this.borderRadiusBackButton = 7,
      this.onTapBackButton,
      this.onTapIcon,
      this.customIcon,
      this.titlePadding,
      this.hasTitle = true,
      this.title = 'Title',
      this.titleColor,
      this.titleSize,
      this.iconBackButtonColor,
      this.invertColor = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          onTapBackButton != null
              ? Material(
                  type: MaterialType.transparency,
                  child: Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          color: invertColor ? AppColor.primaryColor : backgroundBackButton,
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          splashColor: invertColor ? Colors.white38 : AppColor.primaryColor.withOpacity(0.38),
                          borderRadius: BorderRadius.circular(14),
                          onTap: onTapBackButton,
                          child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: invertColor ? Colors.white : AppColor.primaryColor),
                        ),
                      )))
              : const SizedBox(
                  height: 46,
                  width: 46,
                ),
          hasTitle
              ? Padding(
                  padding: titlePadding ?? EdgeInsets.zero,
                  child: Container(
                    width: 230.w,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                          color: titleColor ?? (invertColor ? AppColor.primaryColor : Colors.white),
                          fontSize: titleSize ?? 13.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              : SizedBox(),
          onTapIcon != null
              ? Material(
                  type: MaterialType.transparency,
                  child: Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          color: invertColor ? AppColor.primaryColor : backgroundIconButton,
                          borderRadius: BorderRadius.circular(14.r)),
                      child: Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                          splashColor: invertColor ? Colors.white38 : AppColor.primaryColor.withOpacity(0.38),
                          borderRadius: BorderRadius.circular(14),
                          onTap: onTapIcon,
                          child: customIcon ??
                              Icon(
                                Icons.add,
                                size: 32,
                                color: invertColor ? Colors.white : AppColor.primaryColor,
                              ),
                        ),
                      )))
              : const SizedBox(
                  height: 46,
                  width: 46,
                ),
        ],
      ),
    );
  }
}
