// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsModelCopyWith<FieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsModelCopyWith<$Res> {
  factory $FieldsModelCopyWith(
          FieldsModel value, $Res Function(FieldsModel) then) =
      _$FieldsModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      @LatLngConverter() List<LatLng> polygons});
}

/// @nodoc
class _$FieldsModelCopyWithImpl<$Res> implements $FieldsModelCopyWith<$Res> {
  _$FieldsModelCopyWithImpl(this._value, this._then);

  final FieldsModel _value;
  // ignore: unused_field
  final $Res Function(FieldsModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? polygons = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      polygons: polygons == freezed
          ? _value.polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc
abstract class _$$_FieldsModelCopyWith<$Res>
    implements $FieldsModelCopyWith<$Res> {
  factory _$$_FieldsModelCopyWith(
          _$_FieldsModel value, $Res Function(_$_FieldsModel) then) =
      __$$_FieldsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      @ColorConverter() Color color,
      @LatLngConverter() List<LatLng> polygons});
}

/// @nodoc
class __$$_FieldsModelCopyWithImpl<$Res> extends _$FieldsModelCopyWithImpl<$Res>
    implements _$$_FieldsModelCopyWith<$Res> {
  __$$_FieldsModelCopyWithImpl(
      _$_FieldsModel _value, $Res Function(_$_FieldsModel) _then)
      : super(_value, (v) => _then(v as _$_FieldsModel));

  @override
  _$_FieldsModel get _value => super._value as _$_FieldsModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? polygons = freezed,
  }) {
    return _then(_$_FieldsModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      polygons: polygons == freezed
          ? _value._polygons
          : polygons // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
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
      @LatLngConverter() required final List<LatLng> polygons})
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygons);
  }

  @override
  String toString() {
    return 'FieldsModel(id: $id, name: $name, color: $color, polygons: $polygons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldsModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other._polygons, _polygons));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(_polygons));

  @JsonKey(ignore: true)
  @override
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
          @LatLngConverter() required final List<LatLng> polygons}) =
      _$_FieldsModel;

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
  @JsonKey(ignore: true)
  _$$_FieldsModelCopyWith<_$_FieldsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
