// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BrandUserDto _$BrandUserDtoFromJson(Map<String, dynamic> json) {
  return _BrandUserDto.fromJson(json);
}

/// @nodoc
mixin _$BrandUserDto {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  BrandDto get brand => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandUserDtoCopyWith<BrandUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandUserDtoCopyWith<$Res> {
  factory $BrandUserDtoCopyWith(
          BrandUserDto value, $Res Function(BrandUserDto) then) =
      _$BrandUserDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String role,
      BrandDto brand});

  $BrandDtoCopyWith<$Res> get brand;
}

/// @nodoc
class _$BrandUserDtoCopyWithImpl<$Res> implements $BrandUserDtoCopyWith<$Res> {
  _$BrandUserDtoCopyWithImpl(this._value, this._then);

  final BrandUserDto _value;
  // ignore: unused_field
  final $Res Function(BrandUserDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? brand = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandDto,
    ));
  }

  @override
  $BrandDtoCopyWith<$Res> get brand {
    return $BrandDtoCopyWith<$Res>(_value.brand, (value) {
      return _then(_value.copyWith(brand: value));
    });
  }
}

/// @nodoc
abstract class _$$_BrandUserDtoCopyWith<$Res>
    implements $BrandUserDtoCopyWith<$Res> {
  factory _$$_BrandUserDtoCopyWith(
          _$_BrandUserDto value, $Res Function(_$_BrandUserDto) then) =
      __$$_BrandUserDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String email,
      String firstName,
      String lastName,
      String role,
      BrandDto brand});

  @override
  $BrandDtoCopyWith<$Res> get brand;
}

/// @nodoc
class __$$_BrandUserDtoCopyWithImpl<$Res>
    extends _$BrandUserDtoCopyWithImpl<$Res>
    implements _$$_BrandUserDtoCopyWith<$Res> {
  __$$_BrandUserDtoCopyWithImpl(
      _$_BrandUserDto _value, $Res Function(_$_BrandUserDto) _then)
      : super(_value, (v) => _then(v as _$_BrandUserDto));

  @override
  _$_BrandUserDto get _value => super._value as _$_BrandUserDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? role = freezed,
    Object? brand = freezed,
  }) {
    return _then(_$_BrandUserDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as BrandDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrandUserDto implements _BrandUserDto {
  _$_BrandUserDto(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.brand});

  factory _$_BrandUserDto.fromJson(Map<String, dynamic> json) =>
      _$$_BrandUserDtoFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String role;
  @override
  final BrandDto brand;

  @override
  String toString() {
    return 'BrandUserDto(id: $id, email: $email, firstName: $firstName, lastName: $lastName, role: $role, brand: $brand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandUserDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality().equals(other.brand, brand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(brand));

  @JsonKey(ignore: true)
  @override
  _$$_BrandUserDtoCopyWith<_$_BrandUserDto> get copyWith =>
      __$$_BrandUserDtoCopyWithImpl<_$_BrandUserDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BrandUserDtoToJson(
      this,
    );
  }
}

abstract class _BrandUserDto implements BrandUserDto {
  factory _BrandUserDto(
      {required final String id,
      required final String email,
      required final String firstName,
      required final String lastName,
      required final String role,
      required final BrandDto brand}) = _$_BrandUserDto;

  factory _BrandUserDto.fromJson(Map<String, dynamic> json) =
      _$_BrandUserDto.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get role;
  @override
  BrandDto get brand;
  @override
  @JsonKey(ignore: true)
  _$$_BrandUserDtoCopyWith<_$_BrandUserDto> get copyWith =>
      throw _privateConstructorUsedError;
}
