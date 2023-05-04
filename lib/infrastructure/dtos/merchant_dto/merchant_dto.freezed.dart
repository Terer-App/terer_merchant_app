// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'merchant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MerchantDto _$MerchantDtoFromJson(Map<String, dynamic> json) {
  return _MerchantDto.fromJson(json);
}

/// @nodoc
mixin _$MerchantDto {
  @JsonKey(defaultValue: '')
  String? get shopName => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get shopAddress => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get shopPhone => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get shopEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MerchantDtoCopyWith<MerchantDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantDtoCopyWith<$Res> {
  factory $MerchantDtoCopyWith(
          MerchantDto value, $Res Function(MerchantDto) then) =
      _$MerchantDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: '') String? shopName,
      @JsonKey(defaultValue: '') String? shopAddress,
      @JsonKey(defaultValue: '') String? shopPhone,
      @JsonKey(defaultValue: '') String? shopEmail});
}

/// @nodoc
class _$MerchantDtoCopyWithImpl<$Res> implements $MerchantDtoCopyWith<$Res> {
  _$MerchantDtoCopyWithImpl(this._value, this._then);

  final MerchantDto _value;
  // ignore: unused_field
  final $Res Function(MerchantDto) _then;

  @override
  $Res call({
    Object? shopName = freezed,
    Object? shopAddress = freezed,
    Object? shopPhone = freezed,
    Object? shopEmail = freezed,
  }) {
    return _then(_value.copyWith(
      shopName: shopName == freezed
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopAddress: shopAddress == freezed
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shopPhone: shopPhone == freezed
          ? _value.shopPhone
          : shopPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopEmail: shopEmail == freezed
          ? _value.shopEmail
          : shopEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MerchantDtoCopyWith<$Res>
    implements $MerchantDtoCopyWith<$Res> {
  factory _$$_MerchantDtoCopyWith(
          _$_MerchantDto value, $Res Function(_$_MerchantDto) then) =
      __$$_MerchantDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: '') String? shopName,
      @JsonKey(defaultValue: '') String? shopAddress,
      @JsonKey(defaultValue: '') String? shopPhone,
      @JsonKey(defaultValue: '') String? shopEmail});
}

/// @nodoc
class __$$_MerchantDtoCopyWithImpl<$Res> extends _$MerchantDtoCopyWithImpl<$Res>
    implements _$$_MerchantDtoCopyWith<$Res> {
  __$$_MerchantDtoCopyWithImpl(
      _$_MerchantDto _value, $Res Function(_$_MerchantDto) _then)
      : super(_value, (v) => _then(v as _$_MerchantDto));

  @override
  _$_MerchantDto get _value => super._value as _$_MerchantDto;

  @override
  $Res call({
    Object? shopName = freezed,
    Object? shopAddress = freezed,
    Object? shopPhone = freezed,
    Object? shopEmail = freezed,
  }) {
    return _then(_$_MerchantDto(
      shopName: shopName == freezed
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopAddress: shopAddress == freezed
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shopPhone: shopPhone == freezed
          ? _value.shopPhone
          : shopPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      shopEmail: shopEmail == freezed
          ? _value.shopEmail
          : shopEmail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MerchantDto implements _MerchantDto {
  _$_MerchantDto(
      {@JsonKey(defaultValue: '') this.shopName,
      @JsonKey(defaultValue: '') this.shopAddress,
      @JsonKey(defaultValue: '') this.shopPhone,
      @JsonKey(defaultValue: '') this.shopEmail});

  factory _$_MerchantDto.fromJson(Map<String, dynamic> json) =>
      _$$_MerchantDtoFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String? shopName;
  @override
  @JsonKey(defaultValue: '')
  final String? shopAddress;
  @override
  @JsonKey(defaultValue: '')
  final String? shopPhone;
  @override
  @JsonKey(defaultValue: '')
  final String? shopEmail;

  @override
  String toString() {
    return 'MerchantDto(shopName: $shopName, shopAddress: $shopAddress, shopPhone: $shopPhone, shopEmail: $shopEmail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MerchantDto &&
            const DeepCollectionEquality().equals(other.shopName, shopName) &&
            const DeepCollectionEquality()
                .equals(other.shopAddress, shopAddress) &&
            const DeepCollectionEquality().equals(other.shopPhone, shopPhone) &&
            const DeepCollectionEquality().equals(other.shopEmail, shopEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shopName),
      const DeepCollectionEquality().hash(shopAddress),
      const DeepCollectionEquality().hash(shopPhone),
      const DeepCollectionEquality().hash(shopEmail));

  @JsonKey(ignore: true)
  @override
  _$$_MerchantDtoCopyWith<_$_MerchantDto> get copyWith =>
      __$$_MerchantDtoCopyWithImpl<_$_MerchantDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MerchantDtoToJson(
      this,
    );
  }
}

abstract class _MerchantDto implements MerchantDto {
  factory _MerchantDto(
      {@JsonKey(defaultValue: '') final String? shopName,
      @JsonKey(defaultValue: '') final String? shopAddress,
      @JsonKey(defaultValue: '') final String? shopPhone,
      @JsonKey(defaultValue: '') final String? shopEmail}) = _$_MerchantDto;

  factory _MerchantDto.fromJson(Map<String, dynamic> json) =
      _$_MerchantDto.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String? get shopName;
  @override
  @JsonKey(defaultValue: '')
  String? get shopAddress;
  @override
  @JsonKey(defaultValue: '')
  String? get shopPhone;
  @override
  @JsonKey(defaultValue: '')
  String? get shopEmail;
  @override
  @JsonKey(ignore: true)
  _$$_MerchantDtoCopyWith<_$_MerchantDto> get copyWith =>
      throw _privateConstructorUsedError;
}
