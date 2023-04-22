import 'package:flutter/material.dart';
import 'fbutton.dart';

class FNav extends StatefulWidget {
  final ValueChanged<int>? onTabChange;
  final List<FButton> tabs;
  final int selectedIndex;
  final Duration duration;
  const FNav({
    required this.tabs,
    this.onTabChange,
    this.selectedIndex = 0,
    this.duration = const Duration(milliseconds: 800),
    Key? key,
  }) : super(key: key);

  @override
  State<FNav> createState() => _FNavState();
}

class _FNavState extends State<FNav> with SingleTickerProviderStateMixin {
  late int selectedIndex;
  bool clickable = true;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(FNav oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.tabs
                  .map((e) => FButton(
                        size: e.size,
                        boxDecoration: e.boxDecoration,
                        backgroundColor: e.backgroundColor,
                        highlightColor: e.highlightColor,
                        splashColor: e.splashColor,
                        onTap: () {
                          if (!clickable) return;

                          setState(() {
                            selectedIndex = widget.tabs.indexOf(e);
                            clickable = false;
                          });

                          e.onTap?.call();

                          widget.onTabChange?.call(selectedIndex);

                          Future.delayed(widget.duration, () {
                            setState(() {
                              clickable = true;
                            });
                          });
                        },
                        iconColor: e.iconColor,
                        iconBackColor: e.iconBackColor,
                        notSelectediconColor: e.notSelectediconColor,
                        notSelectediconBackColor: e.notSelectediconBackColor,
                        notSelectedtextColor: e.notSelectedtextColor,
                        iconData: e.iconData,
                        iconBehind: e.iconBehind,
                        iconSize: e.iconSize ?? 24,
                        textStyle: e.textStyle ?? const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                        text: e.text ?? 'Accueil',
                        asText: e.asText ?? true,
                        isActiveLock: selectedIndex == widget.tabs.indexOf(e),
                        durationLock: widget.duration,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}

// class CustomShapeAppBar extends CustomPainter {
//   const CustomShapeAppBar();

//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size,
//         paint = Paint()
//           ..shader = ui.Gradient.linear(
//             rect.topCenter,
//             rect.bottomCenter,
//             [
//               Color(0xffC7C8C3),
//               Color(0xffedefea),
//             ],
//           );
//     final path = Path()
//       ..moveTo(0, 0)
//       ..quadraticBezierTo(size.width / 2, size.height / 3, size.width, 0)
//       ..lineTo(size.width, size.height)
//       ..lineTo(0, size.height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
