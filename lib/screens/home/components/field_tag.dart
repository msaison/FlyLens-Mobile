import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Models/fields/fields_model.dart';
import '../../../config.dart';
import '../../../helper.dart';

class FieldTagMain extends StatefulWidget {
  final List<FieldsModel> fieldLists;
  final Function(String? fieldsId) onIndex;
  final bool all;
  const FieldTagMain({required this.fieldLists, required this.onIndex, this.all = false, Key? key}) : super(key: key);

  @override
  State<FieldTagMain> createState() => _FieldTagMainState();
}

class _FieldTagMainState extends State<FieldTagMain> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: ((!widget.all ? [fieldtag('Tous les champs', 0)] : <Widget>[])) +
            List.generate(widget.fieldLists.length, (index) {
              return fieldtag(widget.fieldLists[index].name, index + 1);
            }),
      ),
    );
  }

  Widget fieldtag(String _name, int __index) {
    return Padding(
      padding: EdgeInsets.only(right: 12.h),
      child: inkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => setState(() {
          if (__index > 0)
            widget.onIndex(widget.fieldLists[__index - 1].id);
          else
            widget.onIndex(null);
          _index = __index;
        }),
        child: Container(
          height: 36.h,
          width: 106.w,
          child: Center(
              child: Text(
            _name,
            style: TextStyle(
                color: _index == __index ? Colors.white : AppColor.primaryColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600),
          )),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: _index == __index ? AppColor.lightprimaryColor : AppColor.fiveColor),
      ),
    );
  }
}
