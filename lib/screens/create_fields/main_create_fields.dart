import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../Models/fields/fields_model.dart';
import '../../components/button.dart';
import '../../helper.dart';
import 'components/card_create_fields.dart';
import 'components/header_create_fields.dart';
import 'package:latlong2/latlong.dart';
import 'package:uuid/uuid.dart';

import '../../config.dart';

class MainCreateFields extends StatefulWidget {
  final String enterpriseUid;
  const MainCreateFields({required this.enterpriseUid, Key? key}) : super(key: key);

  @override
  State<MainCreateFields> createState() => _MainCreateFieldsState();
}

class _MainCreateFieldsState extends State<MainCreateFields> {
  bool _isLoading = true;
  bool _isEditingPolygon = false;
  MapController _mapController = MapController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  Color _pickColor = Colors.white;
  String? errorColor;
  List<LatLng> pointTmp = [];
  List<FieldsModel> fields = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Stack(alignment: Alignment.topLeft, fit: StackFit.loose, children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    center: LatLng(50.62535968777625, 1.889277204330555),
                    maxZoom: 19.0,
                    minZoom: 4,
                    zoom: 16.0,
                    onTap: (tapPosition, point) {},
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: GEOMAPLINK,
                      maxZoom: 21,
                      maxNativeZoom: 21,
                    ),
                    MarkerLayer(
                        markers: List.generate(pointTmp.length, (index) {
                      return Marker(
                          point: pointTmp[index],
                          builder: (context) => Icon(
                                Icons.radio_button_checked_rounded,
                                color: _pickColor,
                                size: 15,
                              ));
                    })),
                    PolygonLayer(
                        polygons: List.generate(fields.length, (index) {
                              return Polygon(
                                  points: fields[index].polygons,
                                  isFilled: true,
                                  color: fields[index].color,
                                  label: fields[index].name);
                            }) +
                            [Polygon(points: pointTmp, color: _pickColor.withOpacity(0.5), isFilled: true)]),
                    FutureBuilder(
                      future: getAllFields(widget.enterpriseUid),
                      builder: (context, AsyncSnapshot<List<FieldsModel>> snapshot) {
                        if (snapshot.hasData) {
                          return PolygonLayer(
                              polygons: List.generate(snapshot.data!.length, (index) {
                                    return Polygon(
                                        points: snapshot.data![index].polygons,
                                        isFilled: true,
                                        color: snapshot.data![index].color,
                                        label: snapshot.data![index].name);
                                  }) +
                                  [Polygon(points: pointTmp, color: _pickColor.withOpacity(0.5), isFilled: true)]);
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ],
                ),
                _isEditingPolygon
                    ? Center(
                        child: Icon(
                          Icons.location_searching_rounded,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Colors.black.withOpacity(0.5), offset: Offset(0, 0), blurRadius: 5),
                          ],
                        ),
                      )
                    : SizedBox(),
                HeaderCreateFields(
                  onEditing: _isEditingPolygon,
                  onEditingPointNumber: pointTmp.length,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SafeArea(
                    child: SizedBox(
                      height: 90,
                      child: FutureBuilder(
                          future: getAllFields(widget.enterpriseUid),
                          builder: (context, AsyncSnapshot<List<FieldsModel>> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _mapController.move(snapshot.data![index].center, 16);
                                      });
                                    },
                                    child: CardCreateFields(
                                        fieldName: snapshot.data![index].name,
                                        onTapDelete: () {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection(COLLECTION_ENTERPRISE)
                                                .doc(widget.enterpriseUid)
                                                .collection("Fields")
                                                .doc(snapshot.data![index].id)
                                                .delete();
                                          });
                                        }),
                                  );
                                },
                                itemCount: snapshot.data!.length,
                              );
                            } else
                              return Container();
                          }),
                    ),
                  ),
                ),
                !_isEditingPolygon
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 105.h, right: 23.w),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () => dialogCreateFields(),
                            child: Container(
                              height: 58,
                              width: 58,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                              child: Icon(
                                Icons.add_rounded,
                                size: 30,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(7.r), topRight: Radius.circular(10.r))),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, left: 25.0.w, right: 25.0.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Button(
                                      width: 125.w,
                                      height: 35.h,
                                      textButton: 'Retour en arrière',
                                      border: Border.all(color: AppColor.primaryColor),
                                      textColor: AppColor.primaryColor,
                                      onTap: () {
                                        setState(() {
                                          pointTmp.removeLast();
                                        });
                                      },
                                    ),
                                    Button(
                                      width: 125.w,
                                      height: 35.h,
                                      textButton: 'Ajouter un point',
                                      backgroundColor: AppColor.primaryColor,
                                      onTap: () {
                                        setState(() {
                                          pointTmp.add(_mapController.center);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Button(
                                      width: 125.w,
                                      height: 35.h,
                                      border: Border.all(color: Colors.green),
                                      textColor: Colors.green,
                                      textButton: 'Créer',
                                      onTap: () async {
                                        String uuid = Uuid().v4();
                                        if (pointTmp.length >= 4) {
                                          await FirebaseFirestore.instance
                                              .collection(COLLECTION_ENTERPRISE)
                                              .doc(widget.enterpriseUid)
                                              .collection("Fields")
                                              .doc(uuid)
                                              .set(FieldsModel(
                                                      id: uuid,
                                                      name: _controller.text,
                                                      color: _pickColor,
                                                      polygons: pointTmp,
                                                      center: LatLngBounds.fromPoints(pointTmp).center)
                                                  .toJson());
                                          setState(() {
                                            _isEditingPolygon = false;
                                          });
                                          _controller.clear();
                                          pointTmp.clear();
                                        }
                                      },
                                    ),
                                    Button(
                                      width: 125.w,
                                      height: 35.h,
                                      border: Border.all(color: Colors.red),
                                      textColor: Colors.red,
                                      textButton: 'Annuler',
                                      onTap: () {
                                        setState(() {
                                          _isEditingPolygon = false;
                                          pointTmp.clear();
                                          _controller.clear();
                                          _pickColor = Colors.white;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
              ])
            : Center(
                child: SpinKitWave(
                color: AppColor.primaryColor,
              )));
  }

  Future<dynamic> dialogCreateFields() {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, _setState) {
              return AlertDialog(
                  content: Form(
                      key: _formKey,
                      child: Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Nom du champ*',
                              style:
                                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                            ),
                          ),
                          TextFormField(
                              controller: _controller,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'Il faut donner un nom a votre champ.';
                                if (value.isValidName) return 'Un ou plusieurs character ne sont pas autorisé.';
                                return null;
                              },
                              onChanged: ((value) {
                                _setState(() {});
                                setState(() {});
                              }),
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(fontSize: 12, height: 0),
                                filled: true,
                                fillColor: AppColor.primaryColor.withOpacity(0.03),
                                contentPadding: const EdgeInsets.fromLTRB(9.5, 17.5, 9.5, 17.5),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.redAccent,
                                      width: 0.5,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 0.5,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(
                                      color: AppColor.primaryColor,
                                      width: 0.5,
                                    )),
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                                hintText: "Nom du champ",
                                hintStyle: const TextStyle(
                                    color: Color(0xFF97C1B3), fontSize: 13, fontWeight: FontWeight.w500),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: Text(
                              'Couleur*',
                              style:
                                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColor.primaryColor),
                            ),
                          ),
                          BlockPicker(
                            pickerColor: _pickColor,
                            onColorChanged: ((value) {
                              _setState(() {
                                _pickColor = value;
                                errorColor = null;
                              });
                            }),
                          ),
                          errorColor != null
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    errorColor!,
                                    style: TextStyle(fontSize: 12, color: Colors.redAccent),
                                  ),
                                )
                              : SizedBox(),
                          Button(
                              textButton: 'Suivant',
                              backgroundColor: AppColor.primaryColor,
                              afterText: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: _pickColor),
                                ),
                              ),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_pickColor.value != Colors.white.value) {
                                    setState(() {
                                      _isEditingPolygon = true;
                                      pointTmp.clear();
                                      Navigator.pop(context);
                                    });
                                  } else {
                                    _setState(() {
                                      errorColor = 'Il faut choisir une couleur.';
                                    });
                                  }
                                }
                              }),
                        ],
                      )));
            }));
  }
}
