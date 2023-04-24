// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FieldsModel _$$_FieldsModelFromJson(Map<String, dynamic> json) =>
    _$_FieldsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: const ColorConverter().fromJson(json['color'] as int),
      polygons: (json['polygons'] as List<dynamic>)
          .map((e) => const LatLngConverter().fromJson(e as String))
          .toList(),
      center: const LatLngConverter().fromJson(json['center'] as String),
    );

Map<String, dynamic> _$$_FieldsModelToJson(_$_FieldsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': const ColorConverter().toJson(instance.color),
      'polygons':
          instance.polygons.map(const LatLngConverter().toJson).toList(),
      'center': const LatLngConverter().toJson(instance.center),
    };
