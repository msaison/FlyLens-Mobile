// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'image_analyse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageAnalyseModel _$$_ImageAnalyseModelFromJson(Map<String, dynamic> json) =>
    _$_ImageAnalyseModel(
      message: json['message'] as String,
      imagesAnalysis: (json['imagesAnalysis'] as List<dynamic>)
          .map((e) => ImagesAnalysis.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageAnalyseModelToJson(
        _$_ImageAnalyseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'imagesAnalysis': instance.imagesAnalysis,
    };

_$_ImagesAnalysis _$$_ImagesAnalysisFromJson(Map<String, dynamic> json) =>
    _$_ImagesAnalysis(
      inputImageId: json['inputImageId'] as int,
      analyses: (json['analyses'] as List<dynamic>)
          .map((e) => Analysis.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImagesAnalysisToJson(_$_ImagesAnalysis instance) =>
    <String, dynamic>{
      'inputImageId': instance.inputImageId,
      'analyses': instance.analyses,
    };

_$_Analysis _$$_AnalysisFromJson(Map<String, dynamic> json) => _$_Analysis(
      status: json['status'] as String,
      receivedAt: json['receivedAt'] as String,
      sentAt: json['sentAt'] as String,
      createdAt: json['createdAt'] as String,
      result: AnalysisResult.fromJson(json['result'] as Map<String, dynamic>),
      analysedImageUrl: json['analysedImageUrl'] as String,
    );

Map<String, dynamic> _$$_AnalysisToJson(_$_Analysis instance) =>
    <String, dynamic>{
      'status': instance.status,
      'receivedAt': instance.receivedAt,
      'sentAt': instance.sentAt,
      'createdAt': instance.createdAt,
      'result': instance.result,
      'analysedImageUrl': instance.analysedImageUrl,
    };

_$_AnalysisResult _$$_AnalysisResultFromJson(Map<String, dynamic> json) =>
    _$_AnalysisResult(
      time: (json['time'] as num?)?.toDouble(),
      image: json['image'] == null
          ? null
          : ImageSize.fromJson(json['image'] as Map<String, dynamic>),
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_AnalysisResultToJson(_$_AnalysisResult instance) =>
    <String, dynamic>{
      'time': instance.time,
      'image': instance.image,
      'predictions': instance.predictions,
      'message': instance.message,
    };

_$_ImageSize _$$_ImageSizeFromJson(Map<String, dynamic> json) => _$_ImageSize(
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$$_ImageSizeToJson(_$_ImageSize instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };

_$_Prediction _$$_PredictionFromJson(Map<String, dynamic> json) =>
    _$_Prediction(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      confidence: (json['confidence'] as num).toDouble(),
      classValue: json['classValue'] as String,
    );

Map<String, dynamic> _$$_PredictionToJson(_$_Prediction instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'confidence': instance.confidence,
      'classValue': instance.classValue,
    };
