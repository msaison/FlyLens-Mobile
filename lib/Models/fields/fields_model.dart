import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'fields_model.freezed.dart';
part 'fields_model.g.dart';

@freezed
class FieldsModel with _$FieldsModel {
  const factory FieldsModel({
    required String id,
    required String name,
    @ColorConverter() required Color color,
    @LatLngConverter() required List<LatLng> polygons,
  }) = _FieldsModel;

  factory FieldsModel.fromJson(Map<String, dynamic> json) => _$FieldsModelFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int codehex) {
    return Color(codehex);
  }

  @override
  int toJson(Color color) {
    return color.value;
  }
}

class LatLngConverter implements JsonConverter<LatLng, String> {
  const LatLngConverter();

  @override
  LatLng fromJson(String latLng) {
    return LatLng(double.parse(latLng.substring(0, latLng.indexOf(','))),
        double.parse(latLng.substring(latLng.indexOf(',') + 2)));
  }

  @override
  String toJson(LatLng latLng) {
    return '${latLng.latitude.toDouble()}, ${latLng.longitude.toDouble()}';
  }
}
