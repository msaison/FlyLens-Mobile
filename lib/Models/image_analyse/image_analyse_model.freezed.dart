// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, sdk_version_since
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_analyse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageAnalyseModel _$ImageAnalyseModelFromJson(Map<String, dynamic> json) {
  return _ImageAnalyseModel.fromJson(json);
}

/// @nodoc
mixin _$ImageAnalyseModel {
  String get message => throw _privateConstructorUsedError;
  List<ImagesAnalysis> get imagesAnalysis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageAnalyseModelCopyWith<ImageAnalyseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageAnalyseModelCopyWith<$Res> {
  factory $ImageAnalyseModelCopyWith(
          ImageAnalyseModel value, $Res Function(ImageAnalyseModel) then) =
      _$ImageAnalyseModelCopyWithImpl<$Res, ImageAnalyseModel>;
  @useResult
  $Res call({String message, List<ImagesAnalysis> imagesAnalysis});
}

/// @nodoc
class _$ImageAnalyseModelCopyWithImpl<$Res, $Val extends ImageAnalyseModel>
    implements $ImageAnalyseModelCopyWith<$Res> {
  _$ImageAnalyseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? imagesAnalysis = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      imagesAnalysis: null == imagesAnalysis
          ? _value.imagesAnalysis
          : imagesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ImagesAnalysis>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageAnalyseModelCopyWith<$Res>
    implements $ImageAnalyseModelCopyWith<$Res> {
  factory _$$_ImageAnalyseModelCopyWith(_$_ImageAnalyseModel value,
          $Res Function(_$_ImageAnalyseModel) then) =
      __$$_ImageAnalyseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<ImagesAnalysis> imagesAnalysis});
}

/// @nodoc
class __$$_ImageAnalyseModelCopyWithImpl<$Res>
    extends _$ImageAnalyseModelCopyWithImpl<$Res, _$_ImageAnalyseModel>
    implements _$$_ImageAnalyseModelCopyWith<$Res> {
  __$$_ImageAnalyseModelCopyWithImpl(
      _$_ImageAnalyseModel _value, $Res Function(_$_ImageAnalyseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? imagesAnalysis = null,
  }) {
    return _then(_$_ImageAnalyseModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      imagesAnalysis: null == imagesAnalysis
          ? _value._imagesAnalysis
          : imagesAnalysis // ignore: cast_nullable_to_non_nullable
              as List<ImagesAnalysis>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageAnalyseModel implements _ImageAnalyseModel {
  const _$_ImageAnalyseModel(
      {required this.message,
      required final List<ImagesAnalysis> imagesAnalysis})
      : _imagesAnalysis = imagesAnalysis;

  factory _$_ImageAnalyseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImageAnalyseModelFromJson(json);

  @override
  final String message;
  final List<ImagesAnalysis> _imagesAnalysis;
  @override
  List<ImagesAnalysis> get imagesAnalysis {
    if (_imagesAnalysis is EqualUnmodifiableListView) return _imagesAnalysis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesAnalysis);
  }

  @override
  String toString() {
    return 'ImageAnalyseModel(message: $message, imagesAnalysis: $imagesAnalysis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageAnalyseModel &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._imagesAnalysis, _imagesAnalysis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(_imagesAnalysis));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageAnalyseModelCopyWith<_$_ImageAnalyseModel> get copyWith =>
      __$$_ImageAnalyseModelCopyWithImpl<_$_ImageAnalyseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageAnalyseModelToJson(
      this,
    );
  }
}

abstract class _ImageAnalyseModel implements ImageAnalyseModel {
  const factory _ImageAnalyseModel(
          {required final String message,
          required final List<ImagesAnalysis> imagesAnalysis}) =
      _$_ImageAnalyseModel;

  factory _ImageAnalyseModel.fromJson(Map<String, dynamic> json) =
      _$_ImageAnalyseModel.fromJson;

  @override
  String get message;
  @override
  List<ImagesAnalysis> get imagesAnalysis;
  @override
  @JsonKey(ignore: true)
  _$$_ImageAnalyseModelCopyWith<_$_ImageAnalyseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ImagesAnalysis _$ImagesAnalysisFromJson(Map<String, dynamic> json) {
  return _ImagesAnalysis.fromJson(json);
}

/// @nodoc
mixin _$ImagesAnalysis {
  int get inputImageId => throw _privateConstructorUsedError;
  List<Analysis> get analyses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagesAnalysisCopyWith<ImagesAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesAnalysisCopyWith<$Res> {
  factory $ImagesAnalysisCopyWith(
          ImagesAnalysis value, $Res Function(ImagesAnalysis) then) =
      _$ImagesAnalysisCopyWithImpl<$Res, ImagesAnalysis>;
  @useResult
  $Res call({int inputImageId, List<Analysis> analyses});
}

/// @nodoc
class _$ImagesAnalysisCopyWithImpl<$Res, $Val extends ImagesAnalysis>
    implements $ImagesAnalysisCopyWith<$Res> {
  _$ImagesAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputImageId = null,
    Object? analyses = null,
  }) {
    return _then(_value.copyWith(
      inputImageId: null == inputImageId
          ? _value.inputImageId
          : inputImageId // ignore: cast_nullable_to_non_nullable
              as int,
      analyses: null == analyses
          ? _value.analyses
          : analyses // ignore: cast_nullable_to_non_nullable
              as List<Analysis>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagesAnalysisCopyWith<$Res>
    implements $ImagesAnalysisCopyWith<$Res> {
  factory _$$_ImagesAnalysisCopyWith(
          _$_ImagesAnalysis value, $Res Function(_$_ImagesAnalysis) then) =
      __$$_ImagesAnalysisCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int inputImageId, List<Analysis> analyses});
}

/// @nodoc
class __$$_ImagesAnalysisCopyWithImpl<$Res>
    extends _$ImagesAnalysisCopyWithImpl<$Res, _$_ImagesAnalysis>
    implements _$$_ImagesAnalysisCopyWith<$Res> {
  __$$_ImagesAnalysisCopyWithImpl(
      _$_ImagesAnalysis _value, $Res Function(_$_ImagesAnalysis) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputImageId = null,
    Object? analyses = null,
  }) {
    return _then(_$_ImagesAnalysis(
      inputImageId: null == inputImageId
          ? _value.inputImageId
          : inputImageId // ignore: cast_nullable_to_non_nullable
              as int,
      analyses: null == analyses
          ? _value._analyses
          : analyses // ignore: cast_nullable_to_non_nullable
              as List<Analysis>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImagesAnalysis implements _ImagesAnalysis {
  const _$_ImagesAnalysis(
      {required this.inputImageId, required final List<Analysis> analyses})
      : _analyses = analyses;

  factory _$_ImagesAnalysis.fromJson(Map<String, dynamic> json) =>
      _$$_ImagesAnalysisFromJson(json);

  @override
  final int inputImageId;
  final List<Analysis> _analyses;
  @override
  List<Analysis> get analyses {
    if (_analyses is EqualUnmodifiableListView) return _analyses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_analyses);
  }

  @override
  String toString() {
    return 'ImagesAnalysis(inputImageId: $inputImageId, analyses: $analyses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagesAnalysis &&
            (identical(other.inputImageId, inputImageId) ||
                other.inputImageId == inputImageId) &&
            const DeepCollectionEquality().equals(other._analyses, _analyses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inputImageId,
      const DeepCollectionEquality().hash(_analyses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagesAnalysisCopyWith<_$_ImagesAnalysis> get copyWith =>
      __$$_ImagesAnalysisCopyWithImpl<_$_ImagesAnalysis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagesAnalysisToJson(
      this,
    );
  }
}

abstract class _ImagesAnalysis implements ImagesAnalysis {
  const factory _ImagesAnalysis(
      {required final int inputImageId,
      required final List<Analysis> analyses}) = _$_ImagesAnalysis;

  factory _ImagesAnalysis.fromJson(Map<String, dynamic> json) =
      _$_ImagesAnalysis.fromJson;

  @override
  int get inputImageId;
  @override
  List<Analysis> get analyses;
  @override
  @JsonKey(ignore: true)
  _$$_ImagesAnalysisCopyWith<_$_ImagesAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

Analysis _$AnalysisFromJson(Map<String, dynamic> json) {
  return _Analysis.fromJson(json);
}

/// @nodoc
mixin _$Analysis {
  String get status => throw _privateConstructorUsedError;
  String get receivedAt => throw _privateConstructorUsedError;
  String get sentAt => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  AnalysisResult get result => throw _privateConstructorUsedError;
  String get analysedImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalysisCopyWith<Analysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisCopyWith<$Res> {
  factory $AnalysisCopyWith(Analysis value, $Res Function(Analysis) then) =
      _$AnalysisCopyWithImpl<$Res, Analysis>;
  @useResult
  $Res call(
      {String status,
      String receivedAt,
      String sentAt,
      String createdAt,
      AnalysisResult result,
      String analysedImageUrl});

  $AnalysisResultCopyWith<$Res> get result;
}

/// @nodoc
class _$AnalysisCopyWithImpl<$Res, $Val extends Analysis>
    implements $AnalysisCopyWith<$Res> {
  _$AnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? receivedAt = null,
    Object? sentAt = null,
    Object? createdAt = null,
    Object? result = null,
    Object? analysedImageUrl = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AnalysisResult,
      analysedImageUrl: null == analysedImageUrl
          ? _value.analysedImageUrl
          : analysedImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnalysisResultCopyWith<$Res> get result {
    return $AnalysisResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnalysisCopyWith<$Res> implements $AnalysisCopyWith<$Res> {
  factory _$$_AnalysisCopyWith(
          _$_Analysis value, $Res Function(_$_Analysis) then) =
      __$$_AnalysisCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String receivedAt,
      String sentAt,
      String createdAt,
      AnalysisResult result,
      String analysedImageUrl});

  @override
  $AnalysisResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$_AnalysisCopyWithImpl<$Res>
    extends _$AnalysisCopyWithImpl<$Res, _$_Analysis>
    implements _$$_AnalysisCopyWith<$Res> {
  __$$_AnalysisCopyWithImpl(
      _$_Analysis _value, $Res Function(_$_Analysis) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? receivedAt = null,
    Object? sentAt = null,
    Object? createdAt = null,
    Object? result = null,
    Object? analysedImageUrl = null,
  }) {
    return _then(_$_Analysis(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AnalysisResult,
      analysedImageUrl: null == analysedImageUrl
          ? _value.analysedImageUrl
          : analysedImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Analysis implements _Analysis {
  const _$_Analysis(
      {required this.status,
      required this.receivedAt,
      required this.sentAt,
      required this.createdAt,
      required this.result,
      required this.analysedImageUrl});

  factory _$_Analysis.fromJson(Map<String, dynamic> json) =>
      _$$_AnalysisFromJson(json);

  @override
  final String status;
  @override
  final String receivedAt;
  @override
  final String sentAt;
  @override
  final String createdAt;
  @override
  final AnalysisResult result;
  @override
  final String analysedImageUrl;

  @override
  String toString() {
    return 'Analysis(status: $status, receivedAt: $receivedAt, sentAt: $sentAt, createdAt: $createdAt, result: $result, analysedImageUrl: $analysedImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Analysis &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.analysedImageUrl, analysedImageUrl) ||
                other.analysedImageUrl == analysedImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, receivedAt, sentAt,
      createdAt, result, analysedImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalysisCopyWith<_$_Analysis> get copyWith =>
      __$$_AnalysisCopyWithImpl<_$_Analysis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalysisToJson(
      this,
    );
  }
}

abstract class _Analysis implements Analysis {
  const factory _Analysis(
      {required final String status,
      required final String receivedAt,
      required final String sentAt,
      required final String createdAt,
      required final AnalysisResult result,
      required final String analysedImageUrl}) = _$_Analysis;

  factory _Analysis.fromJson(Map<String, dynamic> json) = _$_Analysis.fromJson;

  @override
  String get status;
  @override
  String get receivedAt;
  @override
  String get sentAt;
  @override
  String get createdAt;
  @override
  AnalysisResult get result;
  @override
  String get analysedImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AnalysisCopyWith<_$_Analysis> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalysisResult _$AnalysisResultFromJson(Map<String, dynamic> json) {
  return _AnalysisResult.fromJson(json);
}

/// @nodoc
mixin _$AnalysisResult {
  double? get time => throw _privateConstructorUsedError;
  ImageSize? get image => throw _privateConstructorUsedError;
  List<Prediction>? get predictions => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalysisResultCopyWith<AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultCopyWith<$Res> {
  factory $AnalysisResultCopyWith(
          AnalysisResult value, $Res Function(AnalysisResult) then) =
      _$AnalysisResultCopyWithImpl<$Res, AnalysisResult>;
  @useResult
  $Res call(
      {double? time,
      ImageSize? image,
      List<Prediction>? predictions,
      String? message});

  $ImageSizeCopyWith<$Res>? get image;
}

/// @nodoc
class _$AnalysisResultCopyWithImpl<$Res, $Val extends AnalysisResult>
    implements $AnalysisResultCopyWith<$Res> {
  _$AnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? image = freezed,
    Object? predictions = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSize?,
      predictions: freezed == predictions
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Prediction>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageSizeCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageSizeCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnalysisResultCopyWith<$Res>
    implements $AnalysisResultCopyWith<$Res> {
  factory _$$_AnalysisResultCopyWith(
          _$_AnalysisResult value, $Res Function(_$_AnalysisResult) then) =
      __$$_AnalysisResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? time,
      ImageSize? image,
      List<Prediction>? predictions,
      String? message});

  @override
  $ImageSizeCopyWith<$Res>? get image;
}

/// @nodoc
class __$$_AnalysisResultCopyWithImpl<$Res>
    extends _$AnalysisResultCopyWithImpl<$Res, _$_AnalysisResult>
    implements _$$_AnalysisResultCopyWith<$Res> {
  __$$_AnalysisResultCopyWithImpl(
      _$_AnalysisResult _value, $Res Function(_$_AnalysisResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = freezed,
    Object? image = freezed,
    Object? predictions = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_AnalysisResult(
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageSize?,
      predictions: freezed == predictions
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Prediction>?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalysisResult implements _AnalysisResult {
  const _$_AnalysisResult(
      {this.time,
      this.image,
      final List<Prediction>? predictions,
      this.message})
      : _predictions = predictions;

  factory _$_AnalysisResult.fromJson(Map<String, dynamic> json) =>
      _$$_AnalysisResultFromJson(json);

  @override
  final double? time;
  @override
  final ImageSize? image;
  final List<Prediction>? _predictions;
  @override
  List<Prediction>? get predictions {
    final value = _predictions;
    if (value == null) return null;
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? message;

  @override
  String toString() {
    return 'AnalysisResult(time: $time, image: $image, predictions: $predictions, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalysisResult &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, image,
      const DeepCollectionEquality().hash(_predictions), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalysisResultCopyWith<_$_AnalysisResult> get copyWith =>
      __$$_AnalysisResultCopyWithImpl<_$_AnalysisResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalysisResultToJson(
      this,
    );
  }
}

abstract class _AnalysisResult implements AnalysisResult {
  const factory _AnalysisResult(
      {final double? time,
      final ImageSize? image,
      final List<Prediction>? predictions,
      final String? message}) = _$_AnalysisResult;

  factory _AnalysisResult.fromJson(Map<String, dynamic> json) =
      _$_AnalysisResult.fromJson;

  @override
  double? get time;
  @override
  ImageSize? get image;
  @override
  List<Prediction>? get predictions;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_AnalysisResultCopyWith<_$_AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageSize _$ImageSizeFromJson(Map<String, dynamic> json) {
  return _ImageSize.fromJson(json);
}

/// @nodoc
mixin _$ImageSize {
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageSizeCopyWith<ImageSize> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageSizeCopyWith<$Res> {
  factory $ImageSizeCopyWith(ImageSize value, $Res Function(ImageSize) then) =
      _$ImageSizeCopyWithImpl<$Res, ImageSize>;
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class _$ImageSizeCopyWithImpl<$Res, $Val extends ImageSize>
    implements $ImageSizeCopyWith<$Res> {
  _$ImageSizeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageSizeCopyWith<$Res> implements $ImageSizeCopyWith<$Res> {
  factory _$$_ImageSizeCopyWith(
          _$_ImageSize value, $Res Function(_$_ImageSize) then) =
      __$$_ImageSizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int width, int height});
}

/// @nodoc
class __$$_ImageSizeCopyWithImpl<$Res>
    extends _$ImageSizeCopyWithImpl<$Res, _$_ImageSize>
    implements _$$_ImageSizeCopyWith<$Res> {
  __$$_ImageSizeCopyWithImpl(
      _$_ImageSize _value, $Res Function(_$_ImageSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
  }) {
    return _then(_$_ImageSize(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageSize implements _ImageSize {
  const _$_ImageSize({required this.width, required this.height});

  factory _$_ImageSize.fromJson(Map<String, dynamic> json) =>
      _$$_ImageSizeFromJson(json);

  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'ImageSize(width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageSize &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageSizeCopyWith<_$_ImageSize> get copyWith =>
      __$$_ImageSizeCopyWithImpl<_$_ImageSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageSizeToJson(
      this,
    );
  }
}

abstract class _ImageSize implements ImageSize {
  const factory _ImageSize(
      {required final int width, required final int height}) = _$_ImageSize;

  factory _ImageSize.fromJson(Map<String, dynamic> json) =
      _$_ImageSize.fromJson;

  @override
  int get width;
  @override
  int get height;
  @override
  @JsonKey(ignore: true)
  _$$_ImageSizeCopyWith<_$_ImageSize> get copyWith =>
      throw _privateConstructorUsedError;
}

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return _Prediction.fromJson(json);
}

/// @nodoc
mixin _$Prediction {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String get classValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionCopyWith<Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionCopyWith<$Res> {
  factory $PredictionCopyWith(
          Prediction value, $Res Function(Prediction) then) =
      _$PredictionCopyWithImpl<$Res, Prediction>;
  @useResult
  $Res call(
      {double x,
      double y,
      double width,
      double height,
      double confidence,
      String classValue});
}

/// @nodoc
class _$PredictionCopyWithImpl<$Res, $Val extends Prediction>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? confidence = null,
    Object? classValue = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      classValue: null == classValue
          ? _value.classValue
          : classValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PredictionCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$_PredictionCopyWith(
          _$_Prediction value, $Res Function(_$_Prediction) then) =
      __$$_PredictionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double x,
      double y,
      double width,
      double height,
      double confidence,
      String classValue});
}

/// @nodoc
class __$$_PredictionCopyWithImpl<$Res>
    extends _$PredictionCopyWithImpl<$Res, _$_Prediction>
    implements _$$_PredictionCopyWith<$Res> {
  __$$_PredictionCopyWithImpl(
      _$_Prediction _value, $Res Function(_$_Prediction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
    Object? width = null,
    Object? height = null,
    Object? confidence = null,
    Object? classValue = null,
  }) {
    return _then(_$_Prediction(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
      classValue: null == classValue
          ? _value.classValue
          : classValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Prediction implements _Prediction {
  const _$_Prediction(
      {required this.x,
      required this.y,
      required this.width,
      required this.height,
      required this.confidence,
      required this.classValue});

  factory _$_Prediction.fromJson(Map<String, dynamic> json) =>
      _$$_PredictionFromJson(json);

  @override
  final double x;
  @override
  final double y;
  @override
  final double width;
  @override
  final double height;
  @override
  final double confidence;
  @override
  final String classValue;

  @override
  String toString() {
    return 'Prediction(x: $x, y: $y, width: $width, height: $height, confidence: $confidence, classValue: $classValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prediction &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.classValue, classValue) ||
                other.classValue == classValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, x, y, width, height, confidence, classValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PredictionCopyWith<_$_Prediction> get copyWith =>
      __$$_PredictionCopyWithImpl<_$_Prediction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PredictionToJson(
      this,
    );
  }
}

abstract class _Prediction implements Prediction {
  const factory _Prediction(
      {required final double x,
      required final double y,
      required final double width,
      required final double height,
      required final double confidence,
      required final String classValue}) = _$_Prediction;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$_Prediction.fromJson;

  @override
  double get x;
  @override
  double get y;
  @override
  double get width;
  @override
  double get height;
  @override
  double get confidence;
  @override
  String get classValue;
  @override
  @JsonKey(ignore: true)
  _$$_PredictionCopyWith<_$_Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}
