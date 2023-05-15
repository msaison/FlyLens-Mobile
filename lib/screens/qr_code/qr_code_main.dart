import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/header.dart';
import '../../config.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeMain extends StatefulWidget {
  final String companyCode;
  const QrCodeMain({required this.companyCode, Key? key}) : super(key: key);

  @override
  State<QrCodeMain> createState() => _QrCodeMainState();
}

class _QrCodeMainState extends State<QrCodeMain> {
  FToast fToast = FToast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Header(
          hasTitle: false,
          invertColor: true,
          onTapBackButton: () => Navigator.pop(context),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                'Votre employer peut directement rejoindre votre entreprise en scannant ce QR Code.',
                textAlign: TextAlign.left,
                style: TextStyle(color: AppColor.primaryColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  QrImageView(
                    data: widget.companyCode,
                    version: QrVersions.auto,
                    foregroundColor: Colors.black,
                    size: 200.h,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                'Ou vous pouvez copié directement le code. En cliquant sur celui-ci',
                textAlign: TextAlign.left,
                style: TextStyle(color: AppColor.primaryColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              SelectableText(
                widget.companyCode,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
                onTap: () {
                        Clipboard.setData(ClipboardData(text: widget.companyCode));
                        Fluttertoast.showToast(msg: 'Copié');
                      },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
