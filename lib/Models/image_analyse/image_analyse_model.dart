import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_analyse_model.freezed.dart';
part 'image_analyse_model.g.dart';

@freezed
class ImageAnalyseModel with _$ImageAnalyseModel {
  const factory ImageAnalyseModel({
    required String message,
    required List<ImagesAnalysis> imagesAnalysis,
  }) = _ImageAnalyseModel;

  factory ImageAnalyseModel.fromJson(Map<String, dynamic> json) =>
      _$ImageAnalyseModelFromJson(json);
}

@freezed
class ImagesAnalysis with _$ImagesAnalysis {
  const factory ImagesAnalysis({
    required int inputImageId,
    required List<Analysis> analyses,
  }) = _ImagesAnalysis;

  factory ImagesAnalysis.fromJson(Map<String, dynamic> json) =>
      _$ImagesAnalysisFromJson(json);
}

@freezed
class Analysis with _$Analysis {
  const factory Analysis({
    required String status,
    required String receivedAt,
    required String sentAt,
    required String createdAt,
    required AnalysisResult result,
    required String analysedImageUrl,
  }) = _Analysis;

  factory Analysis.fromJson(Map<String, dynamic> json) =>
      _$AnalysisFromJson(json);
}

@freezed
class AnalysisResult with _$AnalysisResult {
  const factory AnalysisResult({
    double? time,
    ImageSize? image,
    List<Prediction>? predictions,
    String? message,
  }) = _AnalysisResult;

  factory AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$AnalysisResultFromJson(json);
}

@freezed
class ImageSize with _$ImageSize {
  const factory ImageSize({
    required int width,
    required int height,
  }) = _ImageSize;

  factory ImageSize.fromJson(Map<String, dynamic> json) =>
      _$ImageSizeFromJson(json);
}

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    required double x,
    required double y,
    required double width,
    required double height,
    required double confidence,
    required String classValue,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}
