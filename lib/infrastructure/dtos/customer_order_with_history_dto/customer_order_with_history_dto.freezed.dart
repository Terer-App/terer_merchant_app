// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_order_with_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerOrderWithHistoryDto _$CustomerOrderWithHistoryDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerOrderWithHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerOrderWithHistoryDto {
  @JsonKey(name: 'shopifyOrderId')
  String get shopifyOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dealId')
  String get dealId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dealPrice')
  double get dealPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'dealName')
  String get dealName => throw _privateConstructorUsedError;
  @JsonKey(name: 'datePurchase')
  DateTime get datePurchase => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateExpired')
  DateTime get dateExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'noOfCoupons')
  int get noOfCoupons => throw _privateConstructorUsedError;
  @JsonKey(name: 'noOfCouponsRedeemed')
  int get noOfCouponsRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'giftedCount')
  int get giftedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGifted')
  int get isGifted => throw _privateConstructorUsedError;
  @JsonKey(name: 'redemptionHistory')
  List<RedemptionHistory> get redemptionHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerOrderWithHistoryDtoCopyWith<CustomerOrderWithHistoryDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerOrderWithHistoryDtoCopyWith<$Res> {
  factory $CustomerOrderWithHistoryDtoCopyWith(
          CustomerOrderWithHistoryDto value,
          $Res Function(CustomerOrderWithHistoryDto) then) =
      _$CustomerOrderWithHistoryDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'shopifyOrderId')
          String shopifyOrderId,
      @JsonKey(name: 'userId')
          String userId,
      @JsonKey(name: 'customerName')
          String customerName,
      @JsonKey(name: 'dealId')
          String dealId,
      @JsonKey(name: 'dealPrice')
          double dealPrice,
      @JsonKey(name: 'dealName')
          String dealName,
      @JsonKey(name: 'datePurchase')
          DateTime datePurchase,
      @JsonKey(name: 'dateExpired')
          DateTime dateExpired,
      @JsonKey(name: 'noOfCoupons')
          int noOfCoupons,
      @JsonKey(name: 'noOfCouponsRedeemed')
          int noOfCouponsRedeemed,
      @JsonKey(name: 'giftedCount')
          int giftedCount,
      @JsonKey(name: 'isGifted')
          int isGifted,
      @JsonKey(name: 'redemptionHistory')
          List<RedemptionHistory> redemptionHistory});
}

/// @nodoc
class _$CustomerOrderWithHistoryDtoCopyWithImpl<$Res>
    implements $CustomerOrderWithHistoryDtoCopyWith<$Res> {
  _$CustomerOrderWithHistoryDtoCopyWithImpl(this._value, this._then);

  final CustomerOrderWithHistoryDto _value;
  // ignore: unused_field
  final $Res Function(CustomerOrderWithHistoryDto) _then;

  @override
  $Res call({
    Object? shopifyOrderId = freezed,
    Object? userId = freezed,
    Object? customerName = freezed,
    Object? dealId = freezed,
    Object? dealPrice = freezed,
    Object? dealName = freezed,
    Object? datePurchase = freezed,
    Object? dateExpired = freezed,
    Object? noOfCoupons = freezed,
    Object? noOfCouponsRedeemed = freezed,
    Object? giftedCount = freezed,
    Object? isGifted = freezed,
    Object? redemptionHistory = freezed,
  }) {
    return _then(_value.copyWith(
      shopifyOrderId: shopifyOrderId == freezed
          ? _value.shopifyOrderId
          : shopifyOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      dealId: dealId == freezed
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      dealPrice: dealPrice == freezed
          ? _value.dealPrice
          : dealPrice // ignore: cast_nullable_to_non_nullable
              as double,
      dealName: dealName == freezed
          ? _value.dealName
          : dealName // ignore: cast_nullable_to_non_nullable
              as String,
      datePurchase: datePurchase == freezed
          ? _value.datePurchase
          : datePurchase // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateExpired: dateExpired == freezed
          ? _value.dateExpired
          : dateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noOfCoupons: noOfCoupons == freezed
          ? _value.noOfCoupons
          : noOfCoupons // ignore: cast_nullable_to_non_nullable
              as int,
      noOfCouponsRedeemed: noOfCouponsRedeemed == freezed
          ? _value.noOfCouponsRedeemed
          : noOfCouponsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      giftedCount: giftedCount == freezed
          ? _value.giftedCount
          : giftedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isGifted: isGifted == freezed
          ? _value.isGifted
          : isGifted // ignore: cast_nullable_to_non_nullable
              as int,
      redemptionHistory: redemptionHistory == freezed
          ? _value.redemptionHistory
          : redemptionHistory // ignore: cast_nullable_to_non_nullable
              as List<RedemptionHistory>,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerOrderWithHistoryDtoCopyWith<$Res>
    implements $CustomerOrderWithHistoryDtoCopyWith<$Res> {
  factory _$$_CustomerOrderWithHistoryDtoCopyWith(
          _$_CustomerOrderWithHistoryDto value,
          $Res Function(_$_CustomerOrderWithHistoryDto) then) =
      __$$_CustomerOrderWithHistoryDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'shopifyOrderId')
          String shopifyOrderId,
      @JsonKey(name: 'userId')
          String userId,
      @JsonKey(name: 'customerName')
          String customerName,
      @JsonKey(name: 'dealId')
          String dealId,
      @JsonKey(name: 'dealPrice')
          double dealPrice,
      @JsonKey(name: 'dealName')
          String dealName,
      @JsonKey(name: 'datePurchase')
          DateTime datePurchase,
      @JsonKey(name: 'dateExpired')
          DateTime dateExpired,
      @JsonKey(name: 'noOfCoupons')
          int noOfCoupons,
      @JsonKey(name: 'noOfCouponsRedeemed')
          int noOfCouponsRedeemed,
      @JsonKey(name: 'giftedCount')
          int giftedCount,
      @JsonKey(name: 'isGifted')
          int isGifted,
      @JsonKey(name: 'redemptionHistory')
          List<RedemptionHistory> redemptionHistory});
}

/// @nodoc
class __$$_CustomerOrderWithHistoryDtoCopyWithImpl<$Res>
    extends _$CustomerOrderWithHistoryDtoCopyWithImpl<$Res>
    implements _$$_CustomerOrderWithHistoryDtoCopyWith<$Res> {
  __$$_CustomerOrderWithHistoryDtoCopyWithImpl(
      _$_CustomerOrderWithHistoryDto _value,
      $Res Function(_$_CustomerOrderWithHistoryDto) _then)
      : super(_value, (v) => _then(v as _$_CustomerOrderWithHistoryDto));

  @override
  _$_CustomerOrderWithHistoryDto get _value =>
      super._value as _$_CustomerOrderWithHistoryDto;

  @override
  $Res call({
    Object? shopifyOrderId = freezed,
    Object? userId = freezed,
    Object? customerName = freezed,
    Object? dealId = freezed,
    Object? dealPrice = freezed,
    Object? dealName = freezed,
    Object? datePurchase = freezed,
    Object? dateExpired = freezed,
    Object? noOfCoupons = freezed,
    Object? noOfCouponsRedeemed = freezed,
    Object? giftedCount = freezed,
    Object? isGifted = freezed,
    Object? redemptionHistory = freezed,
  }) {
    return _then(_$_CustomerOrderWithHistoryDto(
      shopifyOrderId: shopifyOrderId == freezed
          ? _value.shopifyOrderId
          : shopifyOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: customerName == freezed
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      dealId: dealId == freezed
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      dealPrice: dealPrice == freezed
          ? _value.dealPrice
          : dealPrice // ignore: cast_nullable_to_non_nullable
              as double,
      dealName: dealName == freezed
          ? _value.dealName
          : dealName // ignore: cast_nullable_to_non_nullable
              as String,
      datePurchase: datePurchase == freezed
          ? _value.datePurchase
          : datePurchase // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateExpired: dateExpired == freezed
          ? _value.dateExpired
          : dateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime,
      noOfCoupons: noOfCoupons == freezed
          ? _value.noOfCoupons
          : noOfCoupons // ignore: cast_nullable_to_non_nullable
              as int,
      noOfCouponsRedeemed: noOfCouponsRedeemed == freezed
          ? _value.noOfCouponsRedeemed
          : noOfCouponsRedeemed // ignore: cast_nullable_to_non_nullable
              as int,
      giftedCount: giftedCount == freezed
          ? _value.giftedCount
          : giftedCount // ignore: cast_nullable_to_non_nullable
              as int,
      isGifted: isGifted == freezed
          ? _value.isGifted
          : isGifted // ignore: cast_nullable_to_non_nullable
              as int,
      redemptionHistory: redemptionHistory == freezed
          ? _value.redemptionHistory
          : redemptionHistory // ignore: cast_nullable_to_non_nullable
              as List<RedemptionHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerOrderWithHistoryDto implements _CustomerOrderWithHistoryDto {
  const _$_CustomerOrderWithHistoryDto(
      {@JsonKey(name: 'shopifyOrderId') required this.shopifyOrderId,
      @JsonKey(name: 'userId') required this.userId,
      @JsonKey(name: 'customerName') required this.customerName,
      @JsonKey(name: 'dealId') required this.dealId,
      @JsonKey(name: 'dealPrice') required this.dealPrice,
      @JsonKey(name: 'dealName') required this.dealName,
      @JsonKey(name: 'datePurchase') required this.datePurchase,
      @JsonKey(name: 'dateExpired') required this.dateExpired,
      @JsonKey(name: 'noOfCoupons') required this.noOfCoupons,
      @JsonKey(name: 'noOfCouponsRedeemed') required this.noOfCouponsRedeemed,
      @JsonKey(name: 'giftedCount') required this.giftedCount,
      @JsonKey(name: 'isGifted') required this.isGifted,
      @JsonKey(name: 'redemptionHistory') required this.redemptionHistory});

  factory _$_CustomerOrderWithHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerOrderWithHistoryDtoFromJson(json);

  @override
  @JsonKey(name: 'shopifyOrderId')
  final String shopifyOrderId;
  @override
  @JsonKey(name: 'userId')
  final String userId;
  @override
  @JsonKey(name: 'customerName')
  final String customerName;
  @override
  @JsonKey(name: 'dealId')
  final String dealId;
  @override
  @JsonKey(name: 'dealPrice')
  final double dealPrice;
  @override
  @JsonKey(name: 'dealName')
  final String dealName;
  @override
  @JsonKey(name: 'datePurchase')
  final DateTime datePurchase;
  @override
  @JsonKey(name: 'dateExpired')
  final DateTime dateExpired;
  @override
  @JsonKey(name: 'noOfCoupons')
  final int noOfCoupons;
  @override
  @JsonKey(name: 'noOfCouponsRedeemed')
  final int noOfCouponsRedeemed;
  @override
  @JsonKey(name: 'giftedCount')
  final int giftedCount;
  @override
  @JsonKey(name: 'isGifted')
  final int isGifted;
  @override
  @JsonKey(name: 'redemptionHistory')
  final List<RedemptionHistory> redemptionHistory;

  @override
  String toString() {
    return 'CustomerOrderWithHistoryDto(shopifyOrderId: $shopifyOrderId, userId: $userId, customerName: $customerName, dealId: $dealId, dealPrice: $dealPrice, dealName: $dealName, datePurchase: $datePurchase, dateExpired: $dateExpired, noOfCoupons: $noOfCoupons, noOfCouponsRedeemed: $noOfCouponsRedeemed, giftedCount: $giftedCount, isGifted: $isGifted, redemptionHistory: $redemptionHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerOrderWithHistoryDto &&
            const DeepCollectionEquality()
                .equals(other.shopifyOrderId, shopifyOrderId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.customerName, customerName) &&
            const DeepCollectionEquality().equals(other.dealId, dealId) &&
            const DeepCollectionEquality().equals(other.dealPrice, dealPrice) &&
            const DeepCollectionEquality().equals(other.dealName, dealName) &&
            const DeepCollectionEquality()
                .equals(other.datePurchase, datePurchase) &&
            const DeepCollectionEquality()
                .equals(other.dateExpired, dateExpired) &&
            const DeepCollectionEquality()
                .equals(other.noOfCoupons, noOfCoupons) &&
            const DeepCollectionEquality()
                .equals(other.noOfCouponsRedeemed, noOfCouponsRedeemed) &&
            const DeepCollectionEquality()
                .equals(other.giftedCount, giftedCount) &&
            const DeepCollectionEquality().equals(other.isGifted, isGifted) &&
            const DeepCollectionEquality()
                .equals(other.redemptionHistory, redemptionHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(shopifyOrderId),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(customerName),
      const DeepCollectionEquality().hash(dealId),
      const DeepCollectionEquality().hash(dealPrice),
      const DeepCollectionEquality().hash(dealName),
      const DeepCollectionEquality().hash(datePurchase),
      const DeepCollectionEquality().hash(dateExpired),
      const DeepCollectionEquality().hash(noOfCoupons),
      const DeepCollectionEquality().hash(noOfCouponsRedeemed),
      const DeepCollectionEquality().hash(giftedCount),
      const DeepCollectionEquality().hash(isGifted),
      const DeepCollectionEquality().hash(redemptionHistory));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerOrderWithHistoryDtoCopyWith<_$_CustomerOrderWithHistoryDto>
      get copyWith => __$$_CustomerOrderWithHistoryDtoCopyWithImpl<
          _$_CustomerOrderWithHistoryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerOrderWithHistoryDtoToJson(
      this,
    );
  }
}

abstract class _CustomerOrderWithHistoryDto
    implements CustomerOrderWithHistoryDto {
  const factory _CustomerOrderWithHistoryDto(
          {@JsonKey(name: 'shopifyOrderId')
              required final String shopifyOrderId,
          @JsonKey(name: 'userId')
              required final String userId,
          @JsonKey(name: 'customerName')
              required final String customerName,
          @JsonKey(name: 'dealId')
              required final String dealId,
          @JsonKey(name: 'dealPrice')
              required final double dealPrice,
          @JsonKey(name: 'dealName')
              required final String dealName,
          @JsonKey(name: 'datePurchase')
              required final DateTime datePurchase,
          @JsonKey(name: 'dateExpired')
              required final DateTime dateExpired,
          @JsonKey(name: 'noOfCoupons')
              required final int noOfCoupons,
          @JsonKey(name: 'noOfCouponsRedeemed')
              required final int noOfCouponsRedeemed,
          @JsonKey(name: 'giftedCount')
              required final int giftedCount,
          @JsonKey(name: 'isGifted')
              required final int isGifted,
          @JsonKey(name: 'redemptionHistory')
              required final List<RedemptionHistory> redemptionHistory}) =
      _$_CustomerOrderWithHistoryDto;

  factory _CustomerOrderWithHistoryDto.fromJson(Map<String, dynamic> json) =
      _$_CustomerOrderWithHistoryDto.fromJson;

  @override
  @JsonKey(name: 'shopifyOrderId')
  String get shopifyOrderId;
  @override
  @JsonKey(name: 'userId')
  String get userId;
  @override
  @JsonKey(name: 'customerName')
  String get customerName;
  @override
  @JsonKey(name: 'dealId')
  String get dealId;
  @override
  @JsonKey(name: 'dealPrice')
  double get dealPrice;
  @override
  @JsonKey(name: 'dealName')
  String get dealName;
  @override
  @JsonKey(name: 'datePurchase')
  DateTime get datePurchase;
  @override
  @JsonKey(name: 'dateExpired')
  DateTime get dateExpired;
  @override
  @JsonKey(name: 'noOfCoupons')
  int get noOfCoupons;
  @override
  @JsonKey(name: 'noOfCouponsRedeemed')
  int get noOfCouponsRedeemed;
  @override
  @JsonKey(name: 'giftedCount')
  int get giftedCount;
  @override
  @JsonKey(name: 'isGifted')
  int get isGifted;
  @override
  @JsonKey(name: 'redemptionHistory')
  List<RedemptionHistory> get redemptionHistory;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerOrderWithHistoryDtoCopyWith<_$_CustomerOrderWithHistoryDto>
      get copyWith => throw _privateConstructorUsedError;
}

RedemptionHistory _$RedemptionHistoryFromJson(Map<String, dynamic> json) {
  return _RedemptionHistory.fromJson(json);
}

/// @nodoc
mixin _$RedemptionHistory {
  @JsonKey(name: 'isRedeemed')
  bool get isRedeemed => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGifted')
  bool get isGifted => throw _privateConstructorUsedError;
  @JsonKey(name: 'isVerified')
  bool get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  String get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'outletDetails')
  OutletDto? get outletDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
  String? get redemptionUniqueDealId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedemptionHistoryCopyWith<RedemptionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedemptionHistoryCopyWith<$Res> {
  factory $RedemptionHistoryCopyWith(
          RedemptionHistory value, $Res Function(RedemptionHistory) then) =
      _$RedemptionHistoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'isRedeemed')
          bool isRedeemed,
      @JsonKey(name: 'isGifted')
          bool isGifted,
      @JsonKey(name: 'isVerified')
          bool isVerified,
      @JsonKey(name: 'date')
          String date,
      @JsonKey(name: 'time')
          String time,
      @JsonKey(name: 'outletDetails')
          OutletDto? outletDetails,
      @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
          String? redemptionUniqueDealId});

  $OutletDtoCopyWith<$Res>? get outletDetails;
}

/// @nodoc
class _$RedemptionHistoryCopyWithImpl<$Res>
    implements $RedemptionHistoryCopyWith<$Res> {
  _$RedemptionHistoryCopyWithImpl(this._value, this._then);

  final RedemptionHistory _value;
  // ignore: unused_field
  final $Res Function(RedemptionHistory) _then;

  @override
  $Res call({
    Object? isRedeemed = freezed,
    Object? isGifted = freezed,
    Object? isVerified = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? outletDetails = freezed,
    Object? redemptionUniqueDealId = freezed,
  }) {
    return _then(_value.copyWith(
      isRedeemed: isRedeemed == freezed
          ? _value.isRedeemed
          : isRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGifted: isGifted == freezed
          ? _value.isGifted
          : isGifted // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      outletDetails: outletDetails == freezed
          ? _value.outletDetails
          : outletDetails // ignore: cast_nullable_to_non_nullable
              as OutletDto?,
      redemptionUniqueDealId: redemptionUniqueDealId == freezed
          ? _value.redemptionUniqueDealId
          : redemptionUniqueDealId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $OutletDtoCopyWith<$Res>? get outletDetails {
    if (_value.outletDetails == null) {
      return null;
    }

    return $OutletDtoCopyWith<$Res>(_value.outletDetails!, (value) {
      return _then(_value.copyWith(outletDetails: value));
    });
  }
}

/// @nodoc
abstract class _$$_RedemptionHistoryCopyWith<$Res>
    implements $RedemptionHistoryCopyWith<$Res> {
  factory _$$_RedemptionHistoryCopyWith(_$_RedemptionHistory value,
          $Res Function(_$_RedemptionHistory) then) =
      __$$_RedemptionHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'isRedeemed')
          bool isRedeemed,
      @JsonKey(name: 'isGifted')
          bool isGifted,
      @JsonKey(name: 'isVerified')
          bool isVerified,
      @JsonKey(name: 'date')
          String date,
      @JsonKey(name: 'time')
          String time,
      @JsonKey(name: 'outletDetails')
          OutletDto? outletDetails,
      @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
          String? redemptionUniqueDealId});

  @override
  $OutletDtoCopyWith<$Res>? get outletDetails;
}

/// @nodoc
class __$$_RedemptionHistoryCopyWithImpl<$Res>
    extends _$RedemptionHistoryCopyWithImpl<$Res>
    implements _$$_RedemptionHistoryCopyWith<$Res> {
  __$$_RedemptionHistoryCopyWithImpl(
      _$_RedemptionHistory _value, $Res Function(_$_RedemptionHistory) _then)
      : super(_value, (v) => _then(v as _$_RedemptionHistory));

  @override
  _$_RedemptionHistory get _value => super._value as _$_RedemptionHistory;

  @override
  $Res call({
    Object? isRedeemed = freezed,
    Object? isGifted = freezed,
    Object? isVerified = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? outletDetails = freezed,
    Object? redemptionUniqueDealId = freezed,
  }) {
    return _then(_$_RedemptionHistory(
      isRedeemed: isRedeemed == freezed
          ? _value.isRedeemed
          : isRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      isGifted: isGifted == freezed
          ? _value.isGifted
          : isGifted // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      outletDetails: outletDetails == freezed
          ? _value.outletDetails
          : outletDetails // ignore: cast_nullable_to_non_nullable
              as OutletDto?,
      redemptionUniqueDealId: redemptionUniqueDealId == freezed
          ? _value.redemptionUniqueDealId
          : redemptionUniqueDealId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RedemptionHistory implements _RedemptionHistory {
  const _$_RedemptionHistory(
      {@JsonKey(name: 'isRedeemed')
          required this.isRedeemed,
      @JsonKey(name: 'isGifted')
          required this.isGifted,
      @JsonKey(name: 'isVerified')
          required this.isVerified,
      @JsonKey(name: 'date')
          required this.date,
      @JsonKey(name: 'time')
          required this.time,
      @JsonKey(name: 'outletDetails')
          this.outletDetails,
      @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
          this.redemptionUniqueDealId});

  factory _$_RedemptionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_RedemptionHistoryFromJson(json);

  @override
  @JsonKey(name: 'isRedeemed')
  final bool isRedeemed;
  @override
  @JsonKey(name: 'isGifted')
  final bool isGifted;
  @override
  @JsonKey(name: 'isVerified')
  final bool isVerified;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'time')
  final String time;
  @override
  @JsonKey(name: 'outletDetails')
  final OutletDto? outletDetails;
  @override
  @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
  final String? redemptionUniqueDealId;

  @override
  String toString() {
    return 'RedemptionHistory(isRedeemed: $isRedeemed, isGifted: $isGifted, isVerified: $isVerified, date: $date, time: $time, outletDetails: $outletDetails, redemptionUniqueDealId: $redemptionUniqueDealId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedemptionHistory &&
            const DeepCollectionEquality()
                .equals(other.isRedeemed, isRedeemed) &&
            const DeepCollectionEquality().equals(other.isGifted, isGifted) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.outletDetails, outletDetails) &&
            const DeepCollectionEquality()
                .equals(other.redemptionUniqueDealId, redemptionUniqueDealId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isRedeemed),
      const DeepCollectionEquality().hash(isGifted),
      const DeepCollectionEquality().hash(isVerified),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(outletDetails),
      const DeepCollectionEquality().hash(redemptionUniqueDealId));

  @JsonKey(ignore: true)
  @override
  _$$_RedemptionHistoryCopyWith<_$_RedemptionHistory> get copyWith =>
      __$$_RedemptionHistoryCopyWithImpl<_$_RedemptionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RedemptionHistoryToJson(
      this,
    );
  }
}

abstract class _RedemptionHistory implements RedemptionHistory {
  const factory _RedemptionHistory(
      {@JsonKey(name: 'isRedeemed')
          required final bool isRedeemed,
      @JsonKey(name: 'isGifted')
          required final bool isGifted,
      @JsonKey(name: 'isVerified')
          required final bool isVerified,
      @JsonKey(name: 'date')
          required final String date,
      @JsonKey(name: 'time')
          required final String time,
      @JsonKey(name: 'outletDetails')
          final OutletDto? outletDetails,
      @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
          final String? redemptionUniqueDealId}) = _$_RedemptionHistory;

  factory _RedemptionHistory.fromJson(Map<String, dynamic> json) =
      _$_RedemptionHistory.fromJson;

  @override
  @JsonKey(name: 'isRedeemed')
  bool get isRedeemed;
  @override
  @JsonKey(name: 'isGifted')
  bool get isGifted;
  @override
  @JsonKey(name: 'isVerified')
  bool get isVerified;
  @override
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(name: 'time')
  String get time;
  @override
  @JsonKey(name: 'outletDetails')
  OutletDto? get outletDetails;
  @override
  @JsonKey(name: 'redemptionUniqueDealId', defaultValue: '')
  String? get redemptionUniqueDealId;
  @override
  @JsonKey(ignore: true)
  _$$_RedemptionHistoryCopyWith<_$_RedemptionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
