// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'deal_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DealInfoDto _$DealInfoDtoFromJson(Map<String, dynamic> json) {
  return _DealInfoDto.fromJson(json);
}

/// @nodoc
mixin _$DealInfoDto {
  @JsonKey(defaultValue: '')
  String get dealName => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get redeemDate => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get redeemTime => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int get isItFreeDeal => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 1)
  int get redeemDeals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealInfoDtoCopyWith<DealInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealInfoDtoCopyWith<$Res> {
  factory $DealInfoDtoCopyWith(
          DealInfoDto value, $Res Function(DealInfoDto) then) =
      _$DealInfoDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(defaultValue: '') String dealName,
      @JsonKey(defaultValue: '') String redeemDate,
      @JsonKey(defaultValue: '') String redeemTime,
      @JsonKey(defaultValue: '') String customerName,
      @JsonKey(defaultValue: 0) int isItFreeDeal,
      @JsonKey(defaultValue: 1) int redeemDeals});
}

/// @nodoc
class _$DealInfoDtoCopyWithImpl<$Res> implements $DealInfoDtoCopyWith<$Res> {
  _$DealInfoDtoCopyWithImpl(this._value, this._then);

  final DealInfoDto _value;
  // ignore: unused_field
  final $Res Function(DealInfoDto) _then;

  @override
  $Res call({
    Object? dealName = freezed,
    Object? redeemDate = freezed,
    Object? redeemTime = freezed,
    Object? customerName = freezed,
    Object? isItFreeDeal = freezed,
    Object? redeemDeals = freezed,
  }) {
    return _then(_value.copyWith(
      dealName: dealName == freezed
          ? _value.dealName
          : dealName // ignore: cast_nullable_to_non_nullable
              as String,
      redeemDate: redeemDate == freezed
          ? _value.redeemDate
          : redeemDate // ignore: cast_nullable_to_non_nullable
              as String,
      redeemTime: redeemTime == freezed
          ? _value.redeemTime
          : redeemTime // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      isItFreeDeal: isItFreeDeal == freezed
          ? _value.isItFreeDeal
          : isItFreeDeal // ignore: cast_nullable_to_non_nullable
              as int,
      redeemDeals: redeemDeals == freezed
          ? _value.redeemDeals
          : redeemDeals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_DealInfoDtoCopyWith<$Res>
    implements $DealInfoDtoCopyWith<$Res> {
  factory _$$_DealInfoDtoCopyWith(
          _$_DealInfoDto value, $Res Function(_$_DealInfoDto) then) =
      __$$_DealInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(defaultValue: '') String dealName,
      @JsonKey(defaultValue: '') String redeemDate,
      @JsonKey(defaultValue: '') String redeemTime,
      @JsonKey(defaultValue: '') String customerName,
      @JsonKey(defaultValue: 0) int isItFreeDeal,
      @JsonKey(defaultValue: 1) int redeemDeals});
}

/// @nodoc
class __$$_DealInfoDtoCopyWithImpl<$Res> extends _$DealInfoDtoCopyWithImpl<$Res>
    implements _$$_DealInfoDtoCopyWith<$Res> {
  __$$_DealInfoDtoCopyWithImpl(
      _$_DealInfoDto _value, $Res Function(_$_DealInfoDto) _then)
      : super(_value, (v) => _then(v as _$_DealInfoDto));

  @override
  _$_DealInfoDto get _value => super._value as _$_DealInfoDto;

  @override
  $Res call({
    Object? dealName = freezed,
    Object? redeemDate = freezed,
    Object? redeemTime = freezed,
    Object? customerName = freezed,
    Object? isItFreeDeal = freezed,
    Object? redeemDeals = freezed,
  }) {
    return _then(_$_DealInfoDto(
      dealName: dealName == freezed
          ? _value.dealName
          : dealName // ignore: cast_nullable_to_non_nullable
              as String,
      redeemDate: redeemDate == freezed
          ? _value.redeemDate
          : redeemDate // ignore: cast_nullable_to_non_nullable
              as String,
      redeemTime: redeemTime == freezed
          ? _value.redeemTime
          : redeemTime // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      isItFreeDeal: isItFreeDeal == freezed
          ? _value.isItFreeDeal
          : isItFreeDeal // ignore: cast_nullable_to_non_nullable
              as int,
      redeemDeals: redeemDeals == freezed
          ? _value.redeemDeals
          : redeemDeals // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DealInfoDto implements _DealInfoDto {
  _$_DealInfoDto(
      {@JsonKey(defaultValue: '') required this.dealName,
      @JsonKey(defaultValue: '') required this.redeemDate,
      @JsonKey(defaultValue: '') required this.redeemTime,
      @JsonKey(defaultValue: '') required this.customerName,
      @JsonKey(defaultValue: 0) required this.isItFreeDeal,
      @JsonKey(defaultValue: 1) required this.redeemDeals});

  factory _$_DealInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_DealInfoDtoFromJson(json);

  @override
  @JsonKey(defaultValue: '')
  final String dealName;
  @override
  @JsonKey(defaultValue: '')
  final String redeemDate;
  @override
  @JsonKey(defaultValue: '')
  final String redeemTime;
  @override
  @JsonKey(defaultValue: '')
  final String customerName;
  @override
  @JsonKey(defaultValue: 0)
  final int isItFreeDeal;
  @override
  @JsonKey(defaultValue: 1)
  final int redeemDeals;

  @override
  String toString() {
    return 'DealInfoDto(dealName: $dealName, redeemDate: $redeemDate, redeemTime: $redeemTime, customerName: $customerName, isItFreeDeal: $isItFreeDeal, redeemDeals: $redeemDeals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealInfoDto &&
            const DeepCollectionEquality().equals(other.dealName, dealName) &&
            const DeepCollectionEquality()
                .equals(other.redeemDate, redeemDate) &&
            const DeepCollectionEquality()
                .equals(other.redeemTime, redeemTime) &&
            const DeepCollectionEquality()
                .equals(other.customerName, customerName) &&
            const DeepCollectionEquality()
                .equals(other.isItFreeDeal, isItFreeDeal) &&
            const DeepCollectionEquality()
                .equals(other.redeemDeals, redeemDeals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dealName),
      const DeepCollectionEquality().hash(redeemDate),
      const DeepCollectionEquality().hash(redeemTime),
      const DeepCollectionEquality().hash(customerName),
      const DeepCollectionEquality().hash(isItFreeDeal),
      const DeepCollectionEquality().hash(redeemDeals));

  @JsonKey(ignore: true)
  @override
  _$$_DealInfoDtoCopyWith<_$_DealInfoDto> get copyWith =>
      __$$_DealInfoDtoCopyWithImpl<_$_DealInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DealInfoDtoToJson(
      this,
    );
  }
}

abstract class _DealInfoDto implements DealInfoDto {
  factory _DealInfoDto(
          {@JsonKey(defaultValue: '') required final String dealName,
          @JsonKey(defaultValue: '') required final String redeemDate,
          @JsonKey(defaultValue: '') required final String redeemTime,
          @JsonKey(defaultValue: '') required final String customerName,
          @JsonKey(defaultValue: 0) required final int isItFreeDeal,
          @JsonKey(defaultValue: 1) required final int redeemDeals}) =
      _$_DealInfoDto;

  factory _DealInfoDto.fromJson(Map<String, dynamic> json) =
      _$_DealInfoDto.fromJson;

  @override
  @JsonKey(defaultValue: '')
  String get dealName;
  @override
  @JsonKey(defaultValue: '')
  String get redeemDate;
  @override
  @JsonKey(defaultValue: '')
  String get redeemTime;
  @override
  @JsonKey(defaultValue: '')
  String get customerName;
  @override
  @JsonKey(defaultValue: 0)
  int get isItFreeDeal;
  @override
  @JsonKey(defaultValue: 1)
  int get redeemDeals;
  @override
  @JsonKey(ignore: true)
  _$$_DealInfoDtoCopyWith<_$_DealInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}
