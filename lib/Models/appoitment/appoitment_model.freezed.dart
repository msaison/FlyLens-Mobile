// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, sdk_version_since
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appoitment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) {
  return _AppointmentModel.fromJson(json);
}

/// @nodoc
mixin _$AppointmentModel {
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentModelCopyWith<AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentModelCopyWith<$Res> {
  factory $AppointmentModelCopyWith(
          AppointmentModel value, $Res Function(AppointmentModel) then) =
      _$AppointmentModelCopyWithImpl<$Res, AppointmentModel>;
  @useResult
  $Res call({@TimestampConverter() DateTime date, String? status});
}

/// @nodoc
class _$AppointmentModelCopyWithImpl<$Res, $Val extends AppointmentModel>
    implements $AppointmentModelCopyWith<$Res> {
  _$AppointmentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentModelCopyWith<$Res>
    implements $AppointmentModelCopyWith<$Res> {
  factory _$$_AppointmentModelCopyWith(
          _$_AppointmentModel value, $Res Function(_$_AppointmentModel) then) =
      __$$_AppointmentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@TimestampConverter() DateTime date, String? status});
}

/// @nodoc
class __$$_AppointmentModelCopyWithImpl<$Res>
    extends _$AppointmentModelCopyWithImpl<$Res, _$_AppointmentModel>
    implements _$$_AppointmentModelCopyWith<$Res> {
  __$$_AppointmentModelCopyWithImpl(
      _$_AppointmentModel _value, $Res Function(_$_AppointmentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? status = freezed,
  }) {
    return _then(_$_AppointmentModel(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppointmentModel implements _AppointmentModel {
  const _$_AppointmentModel(
      {@TimestampConverter() required this.date, this.status = null});

  factory _$_AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentModelFromJson(json);

  @override
  @TimestampConverter()
  final DateTime date;
  @override
  @JsonKey()
  final String? status;

  @override
  String toString() {
    return 'AppointmentModel(date: $date, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppointmentModel &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentModelCopyWith<_$_AppointmentModel> get copyWith =>
      __$$_AppointmentModelCopyWithImpl<_$_AppointmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentModelToJson(
      this,
    );
  }
}

abstract class _AppointmentModel implements AppointmentModel {
  const factory _AppointmentModel(
      {@TimestampConverter() required final DateTime date,
      final String? status}) = _$_AppointmentModel;

  factory _AppointmentModel.fromJson(Map<String, dynamic> json) =
      _$_AppointmentModel.fromJson;

  @override
  @TimestampConverter()
  DateTime get date;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentModelCopyWith<_$_AppointmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
