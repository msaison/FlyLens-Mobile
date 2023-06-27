// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'analyse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnalyseModel _$$_AnalyseModelFromJson(Map<String, dynamic> json) =>
    _$_AnalyseModel(
      message: json['message'] as String,
      health_score: (json['health_score'] as num).toDouble(),
      classes_stats: const LeafConvert()
          .fromJson(json['classes_stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AnalyseModelToJson(_$_AnalyseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'health_score': instance.health_score,
      'classes_stats': const LeafConvert().toJson(instance.classes_stats),
    };
