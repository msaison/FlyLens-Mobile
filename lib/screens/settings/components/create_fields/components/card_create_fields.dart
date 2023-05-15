import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../components/button.dart';

class CardCreateFields extends StatefulWidget {
  final VoidCallback? onTapEdit;
  final VoidCallback? onDoubleTapEdit;
  final VoidCallback? onTapDelete;
  final VoidCallback? onDoubleTapDelete;
  final String fieldName;
  const CardCreateFields({
    this.fieldName = 'FieldsName',
    this.onTapEdit,
    this.onDoubleTapEdit,
    this.onTapDelete,
    this.onDoubleTapDelete,
    Key? key,
  }) : super(key: key);

  @override
  State<CardCreateFields> createState() => _CardCreateFieldsState();
}

class _CardCreateFieldsState extends State<CardCreateFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 150.w),
      decoration: BoxDecoration(color: Color(0xFFF3F0EF), borderRadius: BorderRadius.circular(7.r)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.fieldName,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  width: 60.w,
                  height: 35.h,
                  textButton: 'Edit',
                  backgroundColor: Color(0xFF4BA163),
                  onTap: widget.onTapEdit,
                  onDoubleTap: widget.onDoubleTapEdit,
                ),
                Button(
                  width: 60.w,
                  height: 35.h,
                  textButton: 'Delete',
                  backgroundColor: Color(0xFFEB5353),
                  onTap: widget.onTapDelete,
                  onDoubleTap: widget.onDoubleTapDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
