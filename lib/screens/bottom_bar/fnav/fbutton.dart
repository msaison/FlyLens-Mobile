import 'package:flutter/material.dart';
import '../../../config.dart';

class FButton extends StatefulWidget {
  final Size size;
  final BoxDecoration? boxDecoration;
  final Color? backgroundColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Function()? onTap;
  final double? iconSize;
  final Color? iconColor;
  final Color? iconBackColor;
  final Color? notSelectediconColor;
  final Color? notSelectediconBackColor;
  final Color? notSelectedtextColor;
  final IconData? iconData;
  final IconData? iconBehind;
  final bool isActiveLock;
  final Duration? durationLock;
  final TextStyle? textStyle;
  final String? text;
  final bool? asText;
  const FButton({
    this.size = const Size(58, 58),
    this.boxDecoration,
    this.backgroundColor,
    this.highlightColor,
    this.splashColor,
    this.onTap,
    this.iconColor,
    this.iconBackColor,
    this.notSelectediconColor,
    this.notSelectediconBackColor,
    this.notSelectedtextColor,
    this.iconData,
    this.iconBehind,
    this.iconSize,
    this.isActiveLock = false,
    this.durationLock,
    this.textStyle,
    this.text,
    this.asText = true,
    Key? key,
  }) : super(key: key);

  @override
  State<FButton> createState() => _FButtonState();
}

class _FButtonState extends State<FButton> with SingleTickerProviderStateMixin {
  late bool _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animation = widget.isActiveLock;
    _animationController = AnimationController(vsync: this, duration: widget.durationLock)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _sizeIconTweenAnimation = sizeIconTween().animate(_animationController);
    var _iconColorTweenAnimation = colorTween().animate(_animationController);
    var _iconColorBackTweenAnimation = colorTweenIconBack().animate(_animationController);
    var _textColorTweenAnimation = colorTweenText().animate(_animationController);

    _animation = widget.isActiveLock;
    if (_animation)
      _animationController.forward();
    else {
      _animationController.reset();
    }

    return AnimatedContainer(
      duration: widget.durationLock!,
      height: widget.size.height,
      width: widget.size.width,
      decoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          highlightColor: widget.highlightColor ?? Colors.transparent,
          splashColor: widget.splashColor ?? Colors.transparent,
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment(-0.2, 0.0),
                    child: Icon(
                      widget.iconBehind ?? Icons.access_alarm_sharp,
                      color: _iconColorBackTweenAnimation.value ?? AppColor.lightprimaryColor.withOpacity(0.5),
                      size: (_sizeIconTweenAnimation.value / 10) * 8.5,
                      // widget.iconSize,
                    ),
                  ),
                  Icon(
                    widget.iconData ?? Icons.access_alarm_sharp,
                    color: _iconColorTweenAnimation.value ?? AppColor.primaryColor,
                    size: _sizeIconTweenAnimation.value,
                    // widget.iconSize,
                  ),
                ],
              ),
              widget.asText!
                  ? Column(
                      children: [
                        SizedBox(height: 9),
                        Text(widget.text!,
                            style: widget.textStyle!.copyWith(color: _textColorTweenAnimation.value,
                                fontSize: 10 - (((widget.iconSize! - _sizeIconTweenAnimation.value) / 10) * 2)))
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  TweenSequence<double> sizeIconTween() {
    return TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.iconSize,
            end: ((widget.iconSize! / 10) * 3 < 6) ? 6 : (widget.iconSize! / 10) * 3,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: ((widget.iconSize! / 10) * 3 < 6) ? 6 : (widget.iconSize! / 10) * 3,
            end: widget.iconSize,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.iconSize,
            end: (widget.iconSize! / 10) * 9,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: (widget.iconSize! / 10) * 9,
            end: widget.iconSize,
          ).chain(CurveTween(curve: Curves.ease)),
          weight: 50.0,
        ),
      ],
    );
  }

  ColorTween colorTween() {
    return ColorTween(
        begin: widget.notSelectediconColor ?? AppColor.darkprimaryColor.withOpacity(0.5),
        end: widget.iconColor ?? AppColor.darkprimaryColor);
  }

  ColorTween colorTweenIconBack() {
    return ColorTween(
        begin: widget.notSelectediconBackColor ?? AppColor.darkprimaryColor.withOpacity(0.2),
        end: widget.iconBackColor ?? AppColor.lightprimaryColor);
  }

  ColorTween colorTweenText() {
    return ColorTween(
        begin: widget.notSelectedtextColor ?? AppColor.darkprimaryColor.withOpacity(0.5),
        end: widget.textStyle!.color ?? AppColor.darkprimaryColor);
  }
}
