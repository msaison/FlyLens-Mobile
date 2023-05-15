import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../config.dart';

class Button extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final bool? isEnabled;
  final Widget? child;
  final IconData? beforeIcon;
  final IconData? afterIcon;
  final Widget? afterText;
  final String? textButton;
  final TextStyle? textButtonStyle;
  final double? textButtonSize;
  final Color? backgroundColor;
  final Color? textColor;
  final double? distanceBetweenIconText;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final BoxBorder? border;
  final LinearGradient? gradient;
  final bool loading;
  const Button({
    this.height,
    this.width,
    this.radius,
    this.isEnabled,
    this.child,
    this.beforeIcon,
    this.afterIcon,
    this.textButton,
    this.textButtonStyle,
    this.textButtonSize,
    this.backgroundColor,
    this.textColor,
    this.distanceBetweenIconText,
    this.onTap,
    this.onDoubleTap,
    this.border,
    this.gradient,
    this.loading = false,
    this.afterText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Opacity(
        opacity: isEnabled != null
            ? isEnabled!
                ? 1
                : 0.3
            : 1,
        child: Container(
          height: height ?? 54,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              color:
                  border == null ? (gradient != null ? null : backgroundColor ?? Theme.of(context).primaryColor) : null,
              gradient: gradient,
              borderRadius: BorderRadius.circular(radius ?? 7),
              border: border),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
              onDoubleTap: onDoubleTap,
              borderRadius: BorderRadius.circular(radius ?? 7),
              child: loading
                  ? Center(
                      child: Transform.scale(
                        scale: 0.5,
                        child: SpinKitWave(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : child ??
                      (!loading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                beforeIcon != null
                                    ? Icon(
                                        beforeIcon,
                                        color: Colors.white,
                                      )
                                    : const SizedBox(),
                                SizedBox(width: beforeIcon != null ? distanceBetweenIconText ?? 10 : 0),
                                Text(
                                  textButton ?? 'Button_Text',
                                  style: textButtonStyle ??
                                      TextStyle(
                                          color: textColor ?? Colors.white,
                                          fontSize: textButtonSize ?? 14,
                                          fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: afterIcon != null ? distanceBetweenIconText ?? 10 : 0),
                                afterText ?? const SizedBox(),
                                afterIcon != null
                                    ? Icon(
                                        afterIcon,
                                        color: Colors.white,
                                      )
                                    : const SizedBox()
                              ],
                            )
                          : Transform.scale(
                              scale: 0.6,
                              child: SpinKitWave(
                                color: AppColor.primaryColor,
                              ),
                            )),
            ),
          ),
        ),
      ),
    );
  }
}

class BackButtonUpdated extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Color iconColor;
  final IconData iconData;
  final double size;
  const BackButtonUpdated({
    this.backgroundColor,
    this.onTap,
    this.iconColor = Colors.white,
    this.iconData = Icons.arrow_back_ios_new_rounded,
    this.size = 46,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            height: size.h,
            width: size.h,
            decoration: BoxDecoration(
                color: backgroundColor ?? AppColor.primaryColor, borderRadius: BorderRadius.circular(14.r)),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                splashColor: backgroundColor != null
                    ? backgroundColor!.withOpacity(0.38)
                    : AppColor.primaryColor.withOpacity(0.38),
                borderRadius: BorderRadius.circular(14.r),
                onTap: onTap,
                child: Icon(iconData, color: iconColor),
              ),
            )));
  }
}

class TextButtonUpdated extends StatelessWidget {
  final String clicktextButton;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? textClickColor;
  final TextStyle? textClickStyle;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final TextDecoration? decoration;
  const TextButtonUpdated({
    this.clicktextButton = 'Button',
    this.text,
    this.textColor,
    this.textStyle,
    this.textClickColor,
    this.textClickStyle,
    this.onTap,
    this.mainAxisAlignment,
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        text != null
            ? Text(
                text!,
                style: textStyle ??
                    TextStyle(color: textColor ?? AppColor.fiveColor, fontSize: 13.sp, fontWeight: FontWeight.w500),
              )
            : SizedBox(),
        InkWell(
          onTap: onTap,
          child: Text(
            clicktextButton,
            style: textClickStyle ??
                TextStyle(
                    color: textClickColor ?? AppColor.primaryColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    decoration: decoration ?? TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? widget;
  const CircleButton({required this.onTap, this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 72.h,
          width: 72.w,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: widget),
    );
  }
}
