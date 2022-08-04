import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flylens/components/button.dart';
import 'package:flylens/helper.dart';
import 'package:flylens/screens/create_fields/components/card_create_fields.dart';
import 'package:latlong2/latlong.dart';

import '../../config.dart';

class MainCreateFields extends StatefulWidget {
  const MainCreateFields({Key? key}) : super(key: key);

  @override
  State<MainCreateFields> createState() => _MainCreateFieldsState();
}

class _MainCreateFieldsState extends State<MainCreateFields> {
  bool _isLoading = true;
  MapController _mapController = MapController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();
  Color _pickColor = Colors.white;
  String? errorColor;
  List<Polygon> polygons = [];

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
                layers: [
                  // TileLayerOptions(
                  //   urlTemplate: GEOMAPAGRILINK,
                  // ),
                  TileLayerOptions(
                    urlTemplate: GEOMAPLINK,
                    maxZoom: 21,
                    maxNativeZoom: 21,
                    // wmsOptions: WMSTileLayerOptions(
                    //   baseUrl: 'https://wxs.ign.fr/agriculture/geoportail/r/wms?SERVICE=WMS&REQUEST=GetCapabilities&service=WMS&request=GetMap&styles=&width=256&height=256',
                    //   layers: ['LANDUSE.AGRICULTURE2020'],
                    //   crs: Epsg4326(),
                    //   format: 'image/png',
                    //   version: '1.3.0',
                    // ),
                  ),
                  PolygonLayerOptions(
                    polygons: polygons,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SafeArea(
                  child: SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CardCreateFields(
                          onTapDelete: () => polygons.removeAt(index),
                        );
                      },
                      itemCount: polygons.length,
                    ),
                  ),
                ),
              ),
              Padding(
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
                        color: Color(0xFF033323),
                      ),
                    ),
                  ),
                ),
              )
            ])
          : Center(
              child: SpinKitWave(
                color: Color(0xff033323),
              ),
            ),
    );
  }

  Future<dynamic> dialogCreateFields() {
    return showDialog(
        context: context,
        builder: (context) => StatefulBuilder(builder: (context, _setState) {
              return AlertDialog(
                content: Form(
                  key: _formKey,
                  child: Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Nom du champ*',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF033323)),
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
                        }),
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(fontSize: 12, height: 0),
                            filled: true,
                            fillColor: const Color(0xFF033323).withOpacity(0.03),
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
                                borderSide: const BorderSide(
                                  color: Color(0xFF033323),
                                  width: 0.5,
                                )),
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                            hintText: "Nom du champ",
                            hintStyle:
                                const TextStyle(color: Color(0xFF97C1B3), fontSize: 13, fontWeight: FontWeight.w500)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Text(
                          'Couleur*',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Color(0xFF033323)),
                        ),
                      ),
                      BlockPicker(
                        pickerColor: _pickColor,
                        onColorChanged: ((value) {
                          _setState(() {
                            _pickColor = value;
                            errorColor = null;
                          });
                          print(_pickColor.value.toString());
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
                        textButton: 'Create',
                        backgroundColor: Color(0xFF033323),
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
                            log(_pickColor.value.toString() + "|" + Colors.white.value.toString());
                            if (_pickColor.value != Colors.white.value) {
                              
                            } else {
                              _setState(() {
                                errorColor = 'Il faut choisir une couleur.';
                              });
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
