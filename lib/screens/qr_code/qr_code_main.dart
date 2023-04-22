import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/button.dart';
import '../../helper.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
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
  final CountdownController _controller = new CountdownController(autoStart: true);
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 5;
  String uniqueCode = getRandomCode(4);
  bool codeValid = true;

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
              codeValid
                  ? Countdown(
                      seconds: 5,
                      build: (context, time) {
                        return Center(
                            child: Text(
                          'Le code expire dans ${time.toInt()} secondes',
                          style: TextStyle(color: AppColor.errorColor, fontSize: 13.sp, fontWeight: FontWeight.w500),
                        ));
                      },
                      onFinished: () {
                        setState(() {
                          codeValid = false;
                        });
                      },
                      controller: _controller,
                    )
                  : TextButtonUpdated(
                      clicktextButton: 'Nouveau code',
                      text: 'Le code a expiré, ',
                      onTap: () {
                        setState(() {
                          codeValid = true;
                          uniqueCode = getRandomCode(4);
                        });

                        _controller.restart();
                      },
                    ),
              SizedBox(height: 25.h),
              Text(
                'Votre employer peut directement rejoindre votre entreprise en scannant ce QR Code.',
                textAlign: TextAlign.left,
                style: TextStyle(color: AppColor.primaryColor, fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  QrImage(
                    data: uniqueCode,
                    version: QrVersions.auto,
                    foregroundColor: Colors.black,
                    size: 200.h,
                  ),
                  !codeValid
                      ? Container(
                          height: 200.h,
                          width: 200.h,
                          color: AppColor.errorColor.withOpacity(0.7),
                          child: Icon(
                            Icons.error_outlined,
                            size: 50,
                          ),
                        )
                      : SizedBox(),
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
                codeValid ? 'Code: $uniqueCode' : 'Code éxpiré',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: codeValid ? Colors.black : AppColor.errorColor,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
                onTap: codeValid
                    ? () {
                        Clipboard.setData(ClipboardData(text: '$uniqueCode'));
                        Fluttertoast.showToast(msg: 'Copié');
                      }
                    : null,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
