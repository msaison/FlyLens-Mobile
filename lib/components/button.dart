import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        opacity: isEnabled == null
            ? 1
            : isEnabled!
                ? 1
                : 0.5,
        child: Container(
          height: height ?? 54,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              color: gradient != null ? null : backgroundColor ?? Theme.of(context).primaryColor,
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
                      child: SpinKitWave(
                        color: Color(0xff033323),
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
                              child: const SpinKitWave(
                                color: Color(0xff033323),
                              ),
                            )),
            ),
          ),
        ),
      ),
    );
  }
}
