// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrandDto _$BrandDtoFromJson(Map<String, dynamic> json) {
  return _BrandDto.fromJson(json);
}

/// @nodoc
mixin _$BrandDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandDtoCopyWith<BrandDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandDtoCopyWith<$Res> {
  factory $BrandDtoCopyWith(BrandDto value, $Res Function(BrandDto) then) =
      _$BrandDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      String logo,
      String key,
      String code,
      @JsonKey(defaultValue: '') String? description});
}

/// @nodoc
class _$BrandDtoCopyWithImpl<$Res> implements $BrandDtoCopyWith<$Res> {
  _$BrandDtoCopyWithImpl(this._value, this._then);

  final BrandDto _value;
  // ignore: unused_field
  final $Res Function(BrandDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? key = freezed,
    Object? code = freezed,
    Object? description = freezed,
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
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BrandDtoCopyWith<$Res> implements $BrandDtoCopyWith<$Res> {
  factory _$$_BrandDtoCopyWith(
          _$_BrandDto value, $Res Function(_$_BrandDto) then) =
      __$$_BrandDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      String logo,
      String key,
      String code,
      @JsonKey(defaultValue: '') String? description});
}

/// @nodoc
class __$$_BrandDtoCopyWithImpl<$Res> extends _$BrandDtoCopyWithImpl<$Res>
    implements _$$_BrandDtoCopyWith<$Res> {
  __$$_BrandDtoCopyWithImpl(
      _$_BrandDto _value, $Res Function(_$_BrandDto) _then)
      : super(_value, (v) => _then(v as _$_BrandDto));

  @override
  _$_BrandDto get _value => super._value as _$_BrandDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? logo = freezed,
    Object? key = freezed,
    Object? code = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_BrandDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrandDto implements _BrandDto {
  _$_BrandDto(
      {required this.id,
      required this.name,
      required this.logo,
      required this.key,
      required this.code,
      @JsonKey(defaultValue: '') this.description});

  factory _$_BrandDto.fromJson(Map<String, dynamic> json) =>
      _$$_BrandDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String logo;
  @override
  final String key;
  @override
  final String code;
  @override
  @JsonKey(defaultValue: '')
  final String? description;

  @override
  String toString() {
    return 'BrandDto(id: $id, name: $name, logo: $logo, key: $key, code: $code, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$$_BrandDtoCopyWith<_$_BrandDto> get copyWith =>
      __$$_BrandDtoCopyWithImpl<_$_BrandDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandDtoToJson(
      this,
    );
  }
}

abstract class _BrandDto implements BrandDto {
  factory _BrandDto(
      {required final String id,
      required final String name,
      required final String logo,
      required final String key,
      required final String code,
      @JsonKey(defaultValue: '') final String? description}) = _$_BrandDto;

  factory _BrandDto.fromJson(Map<String, dynamic> json) = _$_BrandDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get logo;
  @override
  String get key;
  @override
  String get code;
  @override
  @JsonKey(defaultValue: '')
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_BrandDtoCopyWith<_$_BrandDto> get copyWith =>
      throw _privateConstructorUsedError;
}
