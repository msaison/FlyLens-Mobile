// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, sdk_version_since
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fields_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FieldsModel _$FieldsModelFromJson(Map<String, dynamic> json) {
  return _FieldsModel.fromJson(json);
}

/// @nodoc
mixin _$FieldsModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  @LatLngConverter()
  List<LatLng> get polygons => throw _privateConstructorUsedError;
  @LatLngConverter()
  LatLng get center => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsModelCopyWith<FieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsModelCopyWith<$Res> {
  factory $FieldsModelCopyWith(
          FieldsModel value, $Res Function(FieldsModel) then) =
      _$FieldsModelCopyWithImpl<$Res, FieldsModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      @LatLngConverter() List<LatLng> polygons,
      @LatLngConverter() LatLng center});
}

/// @nodoc
class _$FieldsModelCopyWithImpl<$Res, $Val extends FieldsModel>
    implements $FieldsModelCopyWith<$Res> {
  _$FieldsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? polygons = null,
    Object? center = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      polygons: null == polygons
          ? _value.polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsModelCopyWith<$Res>
    implements $FieldsModelCopyWith<$Res> {
  factory _$$_FieldsModelCopyWith(
          _$_FieldsModel value, $Res Function(_$_FieldsModel) then) =
      __$$_FieldsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      @LatLngConverter() List<LatLng> polygons,
      @LatLngConverter() LatLng center});
}

/// @nodoc
class __$$_FieldsModelCopyWithImpl<$Res>
    extends _$FieldsModelCopyWithImpl<$Res, _$_FieldsModel>
    implements _$$_FieldsModelCopyWith<$Res> {
  __$$_FieldsModelCopyWithImpl(
      _$_FieldsModel _value, $Res Function(_$_FieldsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? color = null,
    Object? polygons = null,
    Object? center = null,
  }) {
    return _then(_$_FieldsModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      polygons: null == polygons
          ? _value._polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldsModel implements _FieldsModel {
  const _$_FieldsModel(
      {required this.id,
      required this.name,
      @ColorConverter() required this.color,
      @LatLngConverter() required final List<LatLng> polygons,
      @LatLngConverter() required this.center})
      : _polygons = polygons;

  factory _$_FieldsModel.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsModelFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @ColorConverter()
  final Color color;
  final List<LatLng> _polygons;
  @override
  @LatLngConverter()
  List<LatLng> get polygons {
    if (_polygons is EqualUnmodifiableListView) return _polygons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygons);
  }

  @override
  @LatLngConverter()
  final LatLng center;

  @override
  String toString() {
    return 'FieldsModel(id: $id, name: $name, color: $color, polygons: $polygons, center: $center)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other._polygons, _polygons) &&
            (identical(other.center, center) || other.center == center));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, color,
      const DeepCollectionEquality().hash(_polygons), center);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldsModelCopyWith<_$_FieldsModel> get copyWith =>
      __$$_FieldsModelCopyWithImpl<_$_FieldsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldsModelToJson(
      this,
    );
  }
}

abstract class _FieldsModel implements FieldsModel {
  const factory _FieldsModel(
      {required final String id,
      required final String name,
      @ColorConverter() required final Color color,
      @LatLngConverter() required final List<LatLng> polygons,
      @LatLngConverter() required final LatLng center}) = _$_FieldsModel;

  factory _FieldsModel.fromJson(Map<String, dynamic> json) =
      _$_FieldsModel.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @ColorConverter()
  Color get color;
  @override
  @LatLngConverter()
  List<LatLng> get polygons;
  @override
  @LatLngConverter()
  LatLng get center;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsModelCopyWith<_$_FieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
