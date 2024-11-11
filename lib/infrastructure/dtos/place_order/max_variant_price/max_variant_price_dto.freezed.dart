// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'max_variant_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MinVariantPriceDto _$MinVariantPriceDtoFromJson(Map<String, dynamic> json) {
  return _MinVariantPriceDto.fromJson(json);
}

/// @nodoc
mixin _$MinVariantPriceDto {
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencyCode')
  String get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MinVariantPriceDtoCopyWith<MinVariantPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MinVariantPriceDtoCopyWith<$Res> {
  factory $MinVariantPriceDtoCopyWith(
          MinVariantPriceDto value, $Res Function(MinVariantPriceDto) then) =
      _$MinVariantPriceDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'currencyCode') String currencyCode});
}

/// @nodoc
class _$MinVariantPriceDtoCopyWithImpl<$Res>
    implements $MinVariantPriceDtoCopyWith<$Res> {
  _$MinVariantPriceDtoCopyWithImpl(this._value, this._then);

  final MinVariantPriceDto _value;
  // ignore: unused_field
  final $Res Function(MinVariantPriceDto) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? currencyCode = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MinVariantPriceDtoCopyWith<$Res>
    implements $MinVariantPriceDtoCopyWith<$Res> {
  factory _$$_MinVariantPriceDtoCopyWith(_$_MinVariantPriceDto value,
          $Res Function(_$_MinVariantPriceDto) then) =
      __$$_MinVariantPriceDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'currencyCode') String currencyCode});
}

/// @nodoc
class __$$_MinVariantPriceDtoCopyWithImpl<$Res>
    extends _$MinVariantPriceDtoCopyWithImpl<$Res>
    implements _$$_MinVariantPriceDtoCopyWith<$Res> {
  __$$_MinVariantPriceDtoCopyWithImpl(
      _$_MinVariantPriceDto _value, $Res Function(_$_MinVariantPriceDto) _then)
      : super(_value, (v) => _then(v as _$_MinVariantPriceDto));

  @override
  _$_MinVariantPriceDto get _value => super._value as _$_MinVariantPriceDto;

  @override
  $Res call({
    Object? amount = freezed,
    Object? currencyCode = freezed,
  }) {
    return _then(_$_MinVariantPriceDto(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MinVariantPriceDto implements _MinVariantPriceDto {
  const _$_MinVariantPriceDto(
      {@JsonKey(name: 'amount') required this.amount,
      @JsonKey(name: 'currencyCode') required this.currencyCode});

  factory _$_MinVariantPriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_MinVariantPriceDtoFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'currencyCode')
  final String currencyCode;

  @override
  String toString() {
    return 'MinVariantPriceDto(amount: $amount, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MinVariantPriceDto &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.currencyCode, currencyCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(currencyCode));

  @JsonKey(ignore: true)
  @override
  _$$_MinVariantPriceDtoCopyWith<_$_MinVariantPriceDto> get copyWith =>
      __$$_MinVariantPriceDtoCopyWithImpl<_$_MinVariantPriceDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MinVariantPriceDtoToJson(
      this,
    );
  }
}

abstract class _MinVariantPriceDto implements MinVariantPriceDto {
  const factory _MinVariantPriceDto(
          {@JsonKey(name: 'amount') required final String amount,
          @JsonKey(name: 'currencyCode') required final String currencyCode}) =
      _$_MinVariantPriceDto;

  factory _MinVariantPriceDto.fromJson(Map<String, dynamic> json) =
      _$_MinVariantPriceDto.fromJson;

  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'currencyCode')
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$_MinVariantPriceDtoCopyWith<_$_MinVariantPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
