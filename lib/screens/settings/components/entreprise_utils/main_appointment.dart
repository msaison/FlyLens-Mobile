import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../Models/appoitment/appoitment_model.dart';
import '../../../../api.dart';
import '../../../../components/alert_toast.dart';
import '../../../../components/button.dart';
import '../../../../components/header.dart';
import '../../../../components/settings_cellule.dart';
import '../../../../config.dart';

class MainAppointment extends StatefulWidget {
  final String uid;
  const MainAppointment({required this.uid, Key? key}) : super(key: key);

  @override
  State<MainAppointment> createState() => _MainAppointmentState();
}

class _MainAppointmentState extends State<MainAppointment> {
  FToast fToast = FToast();
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Header(
          invertColor: true,
          onTapBackButton: () => Navigator.pop(context),
          titleSize: 20.sp,
          title: 'Rendez-vous',
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
            textButton: 'Demandez un rendez-vous.',
            onTap: () => chooseAppointment(),
            backgroundColor: AppColor.primaryColor,
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text('Vos rendez-vous',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: AppColor.primaryColor, fontSize: 16.sp, fontWeight: FontWeight.w600))),
        ),
        SizedBox(height: 20.h),
        FutureBuilder(
          future: getAllAppointment(widget.uid),
          builder: (context, AsyncSnapshot<List<AppointmentModel>> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: List.generate(snapshot.data!.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.w, left: 30.w, right: 30.w),
                      child: SettingsCellule(
                        text:
                            'le ${snapshot.data![index].date.toString().substring(0, 10)} à ${snapshot.data![index].date.toString().substring(11, 16)}',
                        // text: 'le ${snapshot.data![0].date.toString()}',
                        miniText:
                            !(snapshot.data![index].status == 'validate') ? 'Toujours en attente de validation' : 'Validé',
                        withStartIcon: false,
                        iconArrow: !(snapshot.data![index].status == 'validate')
                            ? Icons.warning_rounded
                            : Icons.check_circle_outline_outlined,
                      ),
                    );
                  }),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    ));
  }

  void chooseAppointment() async {
    _selectedDate = await showDatePicker(
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF033323),
              onPrimary: Colors.white,
              onSurface: Color(0xFF033323),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF033323),
              ),
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    ).then((date) async {
      setState(() {
        _selectedDate = date;
      });
      if (_selectedDate != null) {
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(_selectedDate ?? DateTime.now()),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFF033323),
                  onPrimary: Colors.white,
                  onSurface: Color(0xFF033323),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF033323),
                  ),
                ),
              ),
              child: child ?? const SizedBox(),
            );
          },
        ).then((time) {
          setState(() {
            _selectedDate =
                DateTime(_selectedDate!.year, _selectedDate!.month, _selectedDate!.day, time!.hour, time.minute);
          });
          if (_selectedDate != null) {
            dialogDelete(_selectedDate!, widget.uid);
          } else {
            fToast.showToast(
                gravity: ToastGravity.TOP,
                child: alertToast(message: 'Erreur: Veuillez choisir une date et une heure.'),
                positionedToastBuilder: (context, child) {
                  return Positioned(
                    child: child,
                    top: 40,
                    left: 20,
                    right: 20,
                  );
                });
          }
        });
      }
      return null;
    });
  }

  Future<dynamic> dialogDelete(DateTime date, String id) {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, _setState) {
              return AlertDialog(
                title: Text('Vous êtes sur le point de prendre un rendez-vous.'),
                content: Text(
                    'Une notification sera envoyé afin que notre équipe puisse validé le rendez-vous dans les plus bref delai.'),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                actions: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          textButton: 'Annuler',
                          width: 100.w,
                          height: 40.h,
                          textColor: AppColor.primaryColor,
                          border: Border.all(color: AppColor.primaryColor),
                          onTap: () => Navigator.pop(context),
                        ),
                        Button(
                          textButton: 'Demander',
                          backgroundColor: AppColor.errorColor,
                          width: 100.w,
                          height: 40.h,
                          onTap: () async {
                            await FirebaseFirestore.instance
                                .collection(COLLECTION_ENTERPRISE)
                                .doc(id)
                                .collection('Appointment')
                                .doc()
                                .set({
                              'date': date,
                              'status': 'pending',
                            });
                            setState(() {
                              _selectedDate = null;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
