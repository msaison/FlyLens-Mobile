import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../Models/weather/weather_model.dart';
import '../../../api.dart';
import '../../../components/button.dart';
import '../../../components/form_fields.dart';
import 'package:google_place/google_place.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uuid/uuid.dart';
import '../../../components/weather_show.dart';
import '../../../config.dart';
import 'package:latlong2/latlong.dart';

class WeatherMain extends StatefulWidget {
  const WeatherMain({Key? key}) : super(key: key);

  @override
  State<WeatherMain> createState() => _WeatherMainState();
}

class _WeatherMainState extends State<WeatherMain> {
  bool _isDeleting = false;
  bool _canDelete = false;
  List<String> _selectedDel = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Météo',
              style: TextStyle(color: AppColor.primaryColor, fontSize: 23.sp, fontWeight: FontWeight.w600),
            ),
            Spacer(),
            if (_canDelete)
              TextButtonUpdated(
                  clicktextButton: _isDeleting ? 'Valider' : 'Supprimer',
                  textClickColor: _isDeleting ? AppColor.lightprimaryColor : AppColor.errorColor,
                  onTap: () {
                    User? user = FirebaseAuth.instance.currentUser;
                    setState(() {
                      _isDeleting = !_isDeleting;
                      if (!_isDeleting && user != null) {
                        _selectedDel.forEach((element) {
                          setState(() {
                            FirebaseFirestore.instance
                                .collection(COLLECTION_USER)
                                .doc(user.uid)
                                .collection('Weather')
                                .doc(element)
                                .delete();
                          });
                        });
                        _selectedDel.clear();
                      }
                    });
                  }),
          ],
        ),
        SizedBox(height: 24.h),
        FutureBuilder(
            future: getAllWeather(),
            builder: (context, AsyncSnapshot<List<WeatherModel>?> snapshot) {
              if (snapshot.hasData && snapshot.data!.length > 0) {
                _canDelete = true;
                return Column(
                  children: List.generate(snapshot.data!.length, (index) {
                    return Column(
                      children: [
                        WeatherShow(
                          name: snapshot.data![index].name,
                          latitude: snapshot.data![index].center.latitude,
                          longitude: snapshot.data![index].center.longitude,
                          deleting: _isDeleting,
                          isDeleting: (delete) async {
                            if (delete!) {
                              _selectedDel.add(snapshot.data![index].id);
                            } else {
                              _selectedDel.remove(snapshot.data![index].id);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),
                );
              } else {
                _canDelete = false;
                return Column(
                  children: [
                    Container(
                      height: 71.h,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        'Pas de ville encore ajouter.',
                        style: TextStyle(color: AppColor.lightprimaryColor),
                      )),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              }
            }),
        WeatherAdd(
          onTap: () {
            Navigator.of(context)
                .push(PageTransition(child: WeatherAddPage(), type: PageTransitionType.rightToLeft))
                .then((value) {
              setState(() {});
            });
          },
        ),
      ],
    );
  }
}

class WeatherAddPage extends StatefulWidget {
  const WeatherAddPage({Key? key}) : super(key: key);

  @override
  State<WeatherAddPage> createState() => _WeatherAddPageState();
}

class _WeatherAddPageState extends State<WeatherAddPage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();
  GooglePlace _googlePlace = GooglePlace(GOOGLE_PLACES_API);
  bool _isLoading = false;
  LatLng _latLng = LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: !_isLoading
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    BackButtonUpdated(
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 20.h),
                    GooglePlaceFormField(
                      focusNode: _focusNode,
                      fieldName: 'Ville',
                      hintText: 'Ex. Nice, France',
                      textEditingController: _textEditingController,
                      googlePlace: _googlePlace,
                      position: (latLng) => _latLng = latLng,
                    ),
                    SizedBox(height: 20.h),
                    Button(
                      textButton: 'Ajouter',
                      onTap: () async {
                        String uid = Uuid().v4();
                        User? user = FirebaseAuth.instance.currentUser;
                        if (_textEditingController.text.length > 0 && user != null) {
                          _isLoading = true;
                          FirebaseFirestore.instance
                              .collection(COLLECTION_USER)
                              .doc(user.uid)
                              .collection('Weather')
                              .doc(uid)
                              .set(WeatherModel(id: uid, name: _textEditingController.text, center: _latLng).toJson());
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: SpinKitWave(
                  color: Color.fromARGB(255, 53, 158, 81),
                  size: 20,
                ),
              ),
      ),
    );
  }
}
