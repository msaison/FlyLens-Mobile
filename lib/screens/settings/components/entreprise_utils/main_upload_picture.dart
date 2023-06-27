import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Models/fields/fields_model.dart';
import '../../../../api.dart';
import '../../../../components/alert_toast.dart';
import '../../../../components/button.dart';
import '../../../../components/header.dart';
import '../../../../components/tuple.dart';
import '../../../../config.dart';
import '../../../home/components/field_tag.dart';
import 'package:image_picker/image_picker.dart';

class UploadPictureMain extends StatefulWidget {
  final String uid;
  const UploadPictureMain({required this.uid, Key? key}) : super(key: key);

  @override
  State<UploadPictureMain> createState() => _UploadPictureMainState();
}

class _UploadPictureMainState extends State<UploadPictureMain> {
  FToast fToast = FToast();
  List<File> selectedImages = [];
  String? fieldsId;
  final picker = ImagePicker();
  bool loading = false;

  @override
  void initState() {
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !loading
            ? FutureBuilder(
                future: fetchFieldsByUserId(FirebaseAuth.instance.currentUser!.uid, widget.uid),
                builder: (context, AsyncSnapshot<Tuple2<List<FieldsModel>, String>?> snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Header(
                          invertColor: true,
                          onTapBackButton: () => Navigator.pop(context),
                          titleSize: 20.sp,
                          title: 'Envoyé nous vos photos.',
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Container(height: 1.h, color: AppColor.primaryColor.withOpacity(0.1)),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.h),
                          child: Button(
                            textButton: 'Selectionnez vos photos.',
                            onTap: () => getImages(),
                            backgroundColor: AppColor.primaryColor,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        fieldsId == null
                            ? Center(
                                child: Text('Veuillez selectionner un champs.',
                                    textAlign: TextAlign.center, style: TextStyle(color: AppColor.errorColor),))
                            : const SizedBox(),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: FieldTagMain(
                            all: true,
                            fieldLists: snapshot.data!.item1,
                            onIndex: (fieldID) {
                              setState(() {
                                fieldsId = fieldID;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Expanded(
                          child: selectedImages.isEmpty
                              ? const Center(
                                  child: Text('Vous n\'avez pas encore selectionné d\'images.',
                                      textAlign: TextAlign.center))
                              : GridView.builder(
                                  itemCount: selectedImages.length,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.all(5.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: FileImage(selectedImages[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () => setState(() => selectedImages.removeAt(index)),
                                            iconSize: 24.sp,
                                            icon: Icon(
                                              Icons.close_rounded,
                                              color: AppColor.errorColor,
                                            )),
                                      ),
                                    );
                                  },
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.h, right: 30.h, bottom: 20.h),
                          child: Button(
                            textButton: 'Envoyez vos photos.',
                            onTap: () => sendImages(),
                            backgroundColor: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: SpinKitWave(
                        color: AppColor.primaryColor,
                      ),
                    );
                  }
                })
            : Center(
                child: SpinKitWave(
                color: AppColor.primaryColor,
              )));
  }

  Future sendImages() async {
    if (selectedImages.isNotEmpty && fieldsId != null) {
      setState(() {
        loading = true;
      });
      var status = await sendPicture(selectedImages, "", widget.uid);
      if (status == 200) {
        setState(() {
          selectedImages.clear();
          Navigator.pop(context);
          loading = false;
          fToast.showToast(
              gravity: ToastGravity.TOP,
              child: alertToast(message: 'Photo(s) envoyée(s) avec succès.', success: true),
              positionedToastBuilder: (context, child) {
                return Positioned(
                  child: child,
                  top: 40,
                  left: 20,
                  right: 20,
                );
              });
        });
      }
    } else {
      fToast.showToast(
          gravity: ToastGravity.TOP,
          child: alertToast(message: !(selectedImages.isNotEmpty) ? 'Vous n\'avez séléctionné aucune photo.' : 'Vous n\'avez séléctionné aucun champs.', success: false),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 40,
              left: 20,
              right: 20,
            );
          });
    }
  }

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImages.add(File(xfilePick[i].path));
      }
      setState(
        () {},
      );
    } else {
      fToast.showToast(
          gravity: ToastGravity.TOP,
          child: alertToast(message: 'Rien n\'a étais séléctionné.', success: false),
          positionedToastBuilder: (context, child) {
            return Positioned(
              child: child,
              top: 40,
              left: 20,
              right: 20,
            );
          });
    }
  }
}
