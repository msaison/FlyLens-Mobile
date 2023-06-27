// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'appoitment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppointmentModel _$$_AppointmentModelFromJson(Map<String, dynamic> json) =>
    _$_AppointmentModel(
      date: const TimestampConverter().fromJson(json['date'] as Timestamp),
      status: json['status'] as String? ?? null,
    );

Map<String, dynamic> _$$_AppointmentModelToJson(_$_AppointmentModel instance) =>
    <String, dynamic>{
      'date': const TimestampConverter().toJson(instance.date),
      'status': instance.status,
    };
