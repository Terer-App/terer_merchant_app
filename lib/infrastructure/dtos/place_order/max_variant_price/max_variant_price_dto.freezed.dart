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

MaxVariantPriceDto _$MaxVariantPriceDtoFromJson(Map<String, dynamic> json) {
  return _MaxVariantPriceDto.fromJson(json);
}

/// @nodoc
mixin _$MaxVariantPriceDto {
  @JsonKey(name: "amount")
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "currencyCode")
  String get currencyCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaxVariantPriceDtoCopyWith<MaxVariantPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaxVariantPriceDtoCopyWith<$Res> {
  factory $MaxVariantPriceDtoCopyWith(
          MaxVariantPriceDto value, $Res Function(MaxVariantPriceDto) then) =
      _$MaxVariantPriceDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "amount") String amount,
      @JsonKey(name: "currencyCode") String currencyCode});
}

/// @nodoc
class _$MaxVariantPriceDtoCopyWithImpl<$Res>
    implements $MaxVariantPriceDtoCopyWith<$Res> {
  _$MaxVariantPriceDtoCopyWithImpl(this._value, this._then);

  final MaxVariantPriceDto _value;
  // ignore: unused_field
  final $Res Function(MaxVariantPriceDto) _then;

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
abstract class _$$_MaxVariantPriceDtoCopyWith<$Res>
    implements $MaxVariantPriceDtoCopyWith<$Res> {
  factory _$$_MaxVariantPriceDtoCopyWith(_$_MaxVariantPriceDto value,
          $Res Function(_$_MaxVariantPriceDto) then) =
      __$$_MaxVariantPriceDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "amount") String amount,
      @JsonKey(name: "currencyCode") String currencyCode});
}

/// @nodoc
class __$$_MaxVariantPriceDtoCopyWithImpl<$Res>
    extends _$MaxVariantPriceDtoCopyWithImpl<$Res>
    implements _$$_MaxVariantPriceDtoCopyWith<$Res> {
  __$$_MaxVariantPriceDtoCopyWithImpl(
      _$_MaxVariantPriceDto _value, $Res Function(_$_MaxVariantPriceDto) _then)
      : super(_value, (v) => _then(v as _$_MaxVariantPriceDto));

  @override
  _$_MaxVariantPriceDto get _value => super._value as _$_MaxVariantPriceDto;

  @override
  $Res call({
    Object? amount = freezed,
    Object? currencyCode = freezed,
  }) {
    return _then(_$_MaxVariantPriceDto(
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
class _$_MaxVariantPriceDto implements _MaxVariantPriceDto {
  const _$_MaxVariantPriceDto(
      {@JsonKey(name: "amount") required this.amount,
      @JsonKey(name: "currencyCode") required this.currencyCode});

  factory _$_MaxVariantPriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaxVariantPriceDtoFromJson(json);

  @override
  @JsonKey(name: "amount")
  final String amount;
  @override
  @JsonKey(name: "currencyCode")
  final String currencyCode;

  @override
  String toString() {
    return 'MaxVariantPriceDto(amount: $amount, currencyCode: $currencyCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaxVariantPriceDto &&
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
  _$$_MaxVariantPriceDtoCopyWith<_$_MaxVariantPriceDto> get copyWith =>
      __$$_MaxVariantPriceDtoCopyWithImpl<_$_MaxVariantPriceDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaxVariantPriceDtoToJson(
      this,
    );
  }
}

abstract class _MaxVariantPriceDto implements MaxVariantPriceDto {
  const factory _MaxVariantPriceDto(
          {@JsonKey(name: "amount") required final String amount,
          @JsonKey(name: "currencyCode") required final String currencyCode}) =
      _$_MaxVariantPriceDto;

  factory _MaxVariantPriceDto.fromJson(Map<String, dynamic> json) =
      _$_MaxVariantPriceDto.fromJson;

  @override
  @JsonKey(name: "amount")
  String get amount;
  @override
  @JsonKey(name: "currencyCode")
  String get currencyCode;
  @override
  @JsonKey(ignore: true)
  _$$_MaxVariantPriceDtoCopyWith<_$_MaxVariantPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
