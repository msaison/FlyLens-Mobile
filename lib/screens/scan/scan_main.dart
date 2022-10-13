import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flylens/components/button.dart';
import 'package:flylens/components/form_fields.dart';
import 'package:flylens/components/header.dart';
import 'package:flylens/config.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uuid/uuid.dart';

class ScanMain extends StatefulWidget {
  const ScanMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanMainState();
}

class _ScanMainState extends State<ScanMain> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final String hintUuid = Uuid().v4();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _buildQrView(context),
          Container(
            color: AppColor.primaryColor,
            height: 40.h,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Column(
                children: [
                  Text(
                    "Entrez le code ou collez le.",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.w),
                    child: TextFormUpdated.classic(
                      fieldNameStyle: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w500),
                      backgroundColor: Colors.white,
                      hintText: 'Ex. $hintUuid',
                      hintTextStyle: TextStyle(
                          color: AppColor.primaryColor.withOpacity(0.66), fontSize: 12.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Ou",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Scannez le QR Code.",
                    style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Header(
            hasTitle: false,
            onTapBackButton: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  await controller?.toggleFlash();
                  setState(() {});
                },
                child: Container(
                  height: 72.h,
                  width: 72.w,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: FutureBuilder(
                      future: controller?.getFlashStatus(),
                      builder: (context, AsyncSnapshot<bool?> snapshot) {
                        if (snapshot.hasData && !snapshot.hasError) {
                          return Icon(
                            !snapshot.data! ? Icons.flashlight_off_rounded : Icons.flashlight_on_rounded,
                            color: AppColor.primaryColor,
                          );
                        } else {
                          return Icon(
                            Icons.flashlight_off_rounded,
                            color: AppColor.primaryColor,
                          );
                        }
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context_) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlayMargin: EdgeInsets.only(top: 20.h),
      overlay: QrScannerOverlayShape(
          borderColor: AppColor.fiveColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300.h,
          overlayColor: AppColor.primaryColor),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context_, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      controller.pauseCamera();
      showDialog(
          context: context,
          builder: ((context) {
            return AlertDialog(
              title: Text(
                'Voulez-vous vraiment rejoindre cette entreprise.',
                textAlign: TextAlign.center,
              ),
              actions: [
                Button(
                  textButton: 'Oui',
                  onTap: () {
                    print('oui');
                  },
                ),
                Button(
                  textButton: 'Non',
                  onTap: () {
                    controller.resumeCamera();
                    Navigator.of(context).pop();
                    print('non');
                  },
                ),
              ],
            );
          })).then((value) => controller.resumeCamera());
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()} Permissions set on: $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not have permissions to access to camera!')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
