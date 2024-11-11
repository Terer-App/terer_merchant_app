// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_range_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceRangeDto _$PriceRangeDtoFromJson(Map<String, dynamic> json) {
  return _PriceRangeDto.fromJson(json);
}

/// @nodoc
mixin _$PriceRangeDto {
  @JsonKey(name: 'minVariantPrice')
  MinVariantPriceDto get minVariantPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRangeDtoCopyWith<PriceRangeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRangeDtoCopyWith<$Res> {
  factory $PriceRangeDtoCopyWith(
          PriceRangeDto value, $Res Function(PriceRangeDto) then) =
      _$PriceRangeDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'minVariantPrice') MinVariantPriceDto minVariantPrice});

  $MinVariantPriceDtoCopyWith<$Res> get minVariantPrice;
}

/// @nodoc
class _$PriceRangeDtoCopyWithImpl<$Res>
    implements $PriceRangeDtoCopyWith<$Res> {
  _$PriceRangeDtoCopyWithImpl(this._value, this._then);

  final PriceRangeDto _value;
  // ignore: unused_field
  final $Res Function(PriceRangeDto) _then;

  @override
  $Res call({
    Object? minVariantPrice = freezed,
  }) {
    return _then(_value.copyWith(
      minVariantPrice: minVariantPrice == freezed
          ? _value.minVariantPrice
          : minVariantPrice // ignore: cast_nullable_to_non_nullable
              as MinVariantPriceDto,
    ));
  }

  @override
  $MinVariantPriceDtoCopyWith<$Res> get minVariantPrice {
    return $MinVariantPriceDtoCopyWith<$Res>(_value.minVariantPrice, (value) {
      return _then(_value.copyWith(minVariantPrice: value));
    });
  }
}

/// @nodoc
abstract class _$$_PriceRangeDtoCopyWith<$Res>
    implements $PriceRangeDtoCopyWith<$Res> {
  factory _$$_PriceRangeDtoCopyWith(
          _$_PriceRangeDto value, $Res Function(_$_PriceRangeDto) then) =
      __$$_PriceRangeDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'minVariantPrice') MinVariantPriceDto minVariantPrice});

  @override
  $MinVariantPriceDtoCopyWith<$Res> get minVariantPrice;
}

/// @nodoc
class __$$_PriceRangeDtoCopyWithImpl<$Res>
    extends _$PriceRangeDtoCopyWithImpl<$Res>
    implements _$$_PriceRangeDtoCopyWith<$Res> {
  __$$_PriceRangeDtoCopyWithImpl(
      _$_PriceRangeDto _value, $Res Function(_$_PriceRangeDto) _then)
      : super(_value, (v) => _then(v as _$_PriceRangeDto));

  @override
  _$_PriceRangeDto get _value => super._value as _$_PriceRangeDto;

  @override
  $Res call({
    Object? minVariantPrice = freezed,
  }) {
    return _then(_$_PriceRangeDto(
      minVariantPrice: minVariantPrice == freezed
          ? _value.minVariantPrice
          : minVariantPrice // ignore: cast_nullable_to_non_nullable
              as MinVariantPriceDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceRangeDto implements _PriceRangeDto {
  const _$_PriceRangeDto(
      {@JsonKey(name: 'minVariantPrice') required this.minVariantPrice});

  factory _$_PriceRangeDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceRangeDtoFromJson(json);

  @override
  @JsonKey(name: 'minVariantPrice')
  final MinVariantPriceDto minVariantPrice;

  @override
  String toString() {
    return 'PriceRangeDto(minVariantPrice: $minVariantPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceRangeDto &&
            const DeepCollectionEquality()
                .equals(other.minVariantPrice, minVariantPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(minVariantPrice));

  @JsonKey(ignore: true)
  @override
  _$$_PriceRangeDtoCopyWith<_$_PriceRangeDto> get copyWith =>
      __$$_PriceRangeDtoCopyWithImpl<_$_PriceRangeDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceRangeDtoToJson(
      this,
    );
  }
}

abstract class _PriceRangeDto implements PriceRangeDto {
  const factory _PriceRangeDto(
          {@JsonKey(name: 'minVariantPrice')
              required final MinVariantPriceDto minVariantPrice}) =
      _$_PriceRangeDto;

  factory _PriceRangeDto.fromJson(Map<String, dynamic> json) =
      _$_PriceRangeDto.fromJson;

  @override
  @JsonKey(name: 'minVariantPrice')
  MinVariantPriceDto get minVariantPrice;
  @override
  @JsonKey(ignore: true)
  _$$_PriceRangeDtoCopyWith<_$_PriceRangeDto> get copyWith =>
      throw _privateConstructorUsedError;
}
