// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, sdk_version_since
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analyse_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyseModel _$AnalyseModelFromJson(Map<String, dynamic> json) {
  return _AnalyseModel.fromJson(json);
}

/// @nodoc
mixin _$AnalyseModel {
  String get message => throw _privateConstructorUsedError;
  double get health_score => throw _privateConstructorUsedError;
  @LeafConvert()
  Leaf get classes_stats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyseModelCopyWith<AnalyseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyseModelCopyWith<$Res> {
  factory $AnalyseModelCopyWith(
          AnalyseModel value, $Res Function(AnalyseModel) then) =
      _$AnalyseModelCopyWithImpl<$Res, AnalyseModel>;
  @useResult
  $Res call(
      {String message, double health_score, @LeafConvert() Leaf classes_stats});
}

/// @nodoc
class _$AnalyseModelCopyWithImpl<$Res, $Val extends AnalyseModel>
    implements $AnalyseModelCopyWith<$Res> {
  _$AnalyseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? health_score = null,
    Object? classes_stats = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      health_score: null == health_score
          ? _value.health_score
          : health_score // ignore: cast_nullable_to_non_nullable
              as double,
      classes_stats: null == classes_stats
          ? _value.classes_stats
          : classes_stats // ignore: cast_nullable_to_non_nullable
              as Leaf,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnalyseModelCopyWith<$Res>
    implements $AnalyseModelCopyWith<$Res> {
  factory _$$_AnalyseModelCopyWith(
          _$_AnalyseModel value, $Res Function(_$_AnalyseModel) then) =
      __$$_AnalyseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, double health_score, @LeafConvert() Leaf classes_stats});
}

/// @nodoc
class __$$_AnalyseModelCopyWithImpl<$Res>
    extends _$AnalyseModelCopyWithImpl<$Res, _$_AnalyseModel>
    implements _$$_AnalyseModelCopyWith<$Res> {
  __$$_AnalyseModelCopyWithImpl(
      _$_AnalyseModel _value, $Res Function(_$_AnalyseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? health_score = null,
    Object? classes_stats = null,
  }) {
    return _then(_$_AnalyseModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      health_score: null == health_score
          ? _value.health_score
          : health_score // ignore: cast_nullable_to_non_nullable
              as double,
      classes_stats: null == classes_stats
          ? _value.classes_stats
          : classes_stats // ignore: cast_nullable_to_non_nullable
              as Leaf,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnalyseModel implements _AnalyseModel {
  const _$_AnalyseModel(
      {required this.message,
      required this.health_score,
      @LeafConvert() required this.classes_stats});

  factory _$_AnalyseModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyseModelFromJson(json);

  @override
  final String message;
  @override
  final double health_score;
  @override
  @LeafConvert()
  final Leaf classes_stats;

  @override
  String toString() {
    return 'AnalyseModel(message: $message, health_score: $health_score, classes_stats: $classes_stats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyseModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.health_score, health_score) ||
                other.health_score == health_score) &&
            (identical(other.classes_stats, classes_stats) ||
                other.classes_stats == classes_stats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, health_score, classes_stats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalyseModelCopyWith<_$_AnalyseModel> get copyWith =>
      __$$_AnalyseModelCopyWithImpl<_$_AnalyseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyseModelToJson(
      this,
    );
  }
}

abstract class _AnalyseModel implements AnalyseModel {
  const factory _AnalyseModel(
      {required final String message,
      required final double health_score,
      @LeafConvert() required final Leaf classes_stats}) = _$_AnalyseModel;

  factory _AnalyseModel.fromJson(Map<String, dynamic> json) =
      _$_AnalyseModel.fromJson;

  @override
  String get message;
  @override
  double get health_score;
  @override
  @LeafConvert()
  Leaf get classes_stats;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyseModelCopyWith<_$_AnalyseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
