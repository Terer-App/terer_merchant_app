// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_purchase_deals_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerPurchaseDealsDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPurchaseDealsDetailsEventCopyWith<$Res> {
  factory $CustomerPurchaseDealsDetailsEventCopyWith(
          CustomerPurchaseDealsDetailsEvent value,
          $Res Function(CustomerPurchaseDealsDetailsEvent) then) =
      _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements $CustomerPurchaseDealsDetailsEventCopyWith<$Res> {
  _$CustomerPurchaseDealsDetailsEventCopyWithImpl(this._value, this._then);

  final CustomerPurchaseDealsDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(CustomerPurchaseDealsDetailsEvent) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, (v) => _then(v as _$_Init));

  @override
  _$_Init get _value => super._value as _$_Init;
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements CustomerPurchaseDealsDetailsEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_OnLoadCopyWith<$Res> {
  factory _$$_OnLoadCopyWith(_$_OnLoad value, $Res Function(_$_OnLoad) then) =
      __$$_OnLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnLoadCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements _$$_OnLoadCopyWith<$Res> {
  __$$_OnLoadCopyWithImpl(_$_OnLoad _value, $Res Function(_$_OnLoad) _then)
      : super(_value, (v) => _then(v as _$_OnLoad));

  @override
  _$_OnLoad get _value => super._value as _$_OnLoad;
}

/// @nodoc

class _$_OnLoad implements _OnLoad {
  const _$_OnLoad();

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsEvent.onLoad()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnLoad);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) {
    return onLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) {
    return onLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return onLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return onLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad(this);
    }
    return orElse();
  }
}

abstract class _OnLoad implements CustomerPurchaseDealsDetailsEvent {
  const factory _OnLoad() = _$_OnLoad;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, (v) => _then(v as _$_LoadMore));

  @override
  _$_LoadMore get _value => super._value as _$_LoadMore;
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements CustomerPurchaseDealsDetailsEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_VerifyDealCopyWith<$Res> {
  factory _$$_VerifyDealCopyWith(
          _$_VerifyDeal value, $Res Function(_$_VerifyDeal) then) =
      __$$_VerifyDealCopyWithImpl<$Res>;
  $Res call({String dealId, int orderHistoryIndex, int redemptionHistoryIndex});
}

/// @nodoc
class __$$_VerifyDealCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements _$$_VerifyDealCopyWith<$Res> {
  __$$_VerifyDealCopyWithImpl(
      _$_VerifyDeal _value, $Res Function(_$_VerifyDeal) _then)
      : super(_value, (v) => _then(v as _$_VerifyDeal));

  @override
  _$_VerifyDeal get _value => super._value as _$_VerifyDeal;

  @override
  $Res call({
    Object? dealId = freezed,
    Object? orderHistoryIndex = freezed,
    Object? redemptionHistoryIndex = freezed,
  }) {
    return _then(_$_VerifyDeal(
      dealId: dealId == freezed
          ? _value.dealId
          : dealId // ignore: cast_nullable_to_non_nullable
              as String,
      orderHistoryIndex: orderHistoryIndex == freezed
          ? _value.orderHistoryIndex
          : orderHistoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
      redemptionHistoryIndex: redemptionHistoryIndex == freezed
          ? _value.redemptionHistoryIndex
          : redemptionHistoryIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_VerifyDeal implements _VerifyDeal {
  const _$_VerifyDeal(
      {required this.dealId,
      required this.orderHistoryIndex,
      required this.redemptionHistoryIndex});

  @override
  final String dealId;
  @override
  final int orderHistoryIndex;
  @override
  final int redemptionHistoryIndex;

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsEvent.verifyDeal(dealId: $dealId, orderHistoryIndex: $orderHistoryIndex, redemptionHistoryIndex: $redemptionHistoryIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyDeal &&
            const DeepCollectionEquality().equals(other.dealId, dealId) &&
            const DeepCollectionEquality()
                .equals(other.orderHistoryIndex, orderHistoryIndex) &&
            const DeepCollectionEquality()
                .equals(other.redemptionHistoryIndex, redemptionHistoryIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dealId),
      const DeepCollectionEquality().hash(orderHistoryIndex),
      const DeepCollectionEquality().hash(redemptionHistoryIndex));

  @JsonKey(ignore: true)
  @override
  _$$_VerifyDealCopyWith<_$_VerifyDeal> get copyWith =>
      __$$_VerifyDealCopyWithImpl<_$_VerifyDeal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) {
    return verifyDeal(dealId, orderHistoryIndex, redemptionHistoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) {
    return verifyDeal?.call(dealId, orderHistoryIndex, redemptionHistoryIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (verifyDeal != null) {
      return verifyDeal(dealId, orderHistoryIndex, redemptionHistoryIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return verifyDeal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return verifyDeal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (verifyDeal != null) {
      return verifyDeal(this);
    }
    return orElse();
  }
}

abstract class _VerifyDeal implements CustomerPurchaseDealsDetailsEvent {
  const factory _VerifyDeal(
      {required final String dealId,
      required final int orderHistoryIndex,
      required final int redemptionHistoryIndex}) = _$_VerifyDeal;

  String get dealId;
  int get orderHistoryIndex;
  int get redemptionHistoryIndex;
  @JsonKey(ignore: true)
  _$$_VerifyDealCopyWith<_$_VerifyDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmitFromAnywhereCopyWith<$Res> {
  factory _$$_EmitFromAnywhereCopyWith(
          _$_EmitFromAnywhere value, $Res Function(_$_EmitFromAnywhere) then) =
      __$$_EmitFromAnywhereCopyWithImpl<$Res>;
  $Res call({CustomerPurchaseDealsDetailsState state});

  $CustomerPurchaseDealsDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_EmitFromAnywhereCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsEventCopyWithImpl<$Res>
    implements _$$_EmitFromAnywhereCopyWith<$Res> {
  __$$_EmitFromAnywhereCopyWithImpl(
      _$_EmitFromAnywhere _value, $Res Function(_$_EmitFromAnywhere) _then)
      : super(_value, (v) => _then(v as _$_EmitFromAnywhere));

  @override
  _$_EmitFromAnywhere get _value => super._value as _$_EmitFromAnywhere;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_$_EmitFromAnywhere(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CustomerPurchaseDealsDetailsState,
    ));
  }

  @override
  $CustomerPurchaseDealsDetailsStateCopyWith<$Res> get state {
    return $CustomerPurchaseDealsDetailsStateCopyWith<$Res>(_value.state,
        (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_EmitFromAnywhere implements _EmitFromAnywhere {
  const _$_EmitFromAnywhere({required this.state});

  @override
  final CustomerPurchaseDealsDetailsState state;

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsEvent.emitFromAnywhere(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmitFromAnywhere &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$$_EmitFromAnywhereCopyWith<_$_EmitFromAnywhere> get copyWith =>
      __$$_EmitFromAnywhereCopyWithImpl<_$_EmitFromAnywhere>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function() loadMore,
    required TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)
        verifyDeal,
    required TResult Function(CustomerPurchaseDealsDetailsState state)
        emitFromAnywhere,
  }) {
    return emitFromAnywhere(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
  }) {
    return emitFromAnywhere?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function()? loadMore,
    TResult Function(
            String dealId, int orderHistoryIndex, int redemptionHistoryIndex)?
        verifyDeal,
    TResult Function(CustomerPurchaseDealsDetailsState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (emitFromAnywhere != null) {
      return emitFromAnywhere(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_VerifyDeal value) verifyDeal,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return emitFromAnywhere(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return emitFromAnywhere?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_VerifyDeal value)? verifyDeal,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (emitFromAnywhere != null) {
      return emitFromAnywhere(this);
    }
    return orElse();
  }
}

abstract class _EmitFromAnywhere implements CustomerPurchaseDealsDetailsEvent {
  const factory _EmitFromAnywhere(
          {required final CustomerPurchaseDealsDetailsState state}) =
      _$_EmitFromAnywhere;

  CustomerPurchaseDealsDetailsState get state;
  @JsonKey(ignore: true)
  _$$_EmitFromAnywhereCopyWith<_$_EmitFromAnywhere> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerPurchaseDealsDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String get responseMsg => throw _privateConstructorUsedError;
  String get serverUrl => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  List<CustomerOrderWithHistoryDto> get orderHistory =>
      throw _privateConstructorUsedError;
  PlaceOrderRepository get placeOrderRepository =>
      throw _privateConstructorUsedError;
  BrandUserDto get profile => throw _privateConstructorUsedError;
  AppStateNotifier get appStateNotifier => throw _privateConstructorUsedError;
  String get apiUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerPurchaseDealsDetailsStateCopyWith<CustomerPurchaseDealsDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPurchaseDealsDetailsStateCopyWith<$Res> {
  factory $CustomerPurchaseDealsDetailsStateCopyWith(
          CustomerPurchaseDealsDetailsState value,
          $Res Function(CustomerPurchaseDealsDetailsState) then) =
      _$CustomerPurchaseDealsDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccess,
      bool noUse,
      bool hasMore,
      String responseMsg,
      String serverUrl,
      String customerId,
      String name,
      int skip,
      ScrollController scrollController,
      List<CustomerOrderWithHistoryDto> orderHistory,
      PlaceOrderRepository placeOrderRepository,
      BrandUserDto profile,
      AppStateNotifier appStateNotifier,
      String apiUrl});

  $BrandUserDtoCopyWith<$Res> get profile;
}

/// @nodoc
class _$CustomerPurchaseDealsDetailsStateCopyWithImpl<$Res>
    implements $CustomerPurchaseDealsDetailsStateCopyWith<$Res> {
  _$CustomerPurchaseDealsDetailsStateCopyWithImpl(this._value, this._then);

  final CustomerPurchaseDealsDetailsState _value;
  // ignore: unused_field
  final $Res Function(CustomerPurchaseDealsDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
    Object? noUse = freezed,
    Object? hasMore = freezed,
    Object? responseMsg = freezed,
    Object? serverUrl = freezed,
    Object? customerId = freezed,
    Object? name = freezed,
    Object? skip = freezed,
    Object? scrollController = freezed,
    Object? orderHistory = freezed,
    Object? placeOrderRepository = freezed,
    Object? profile = freezed,
    Object? appStateNotifier = freezed,
    Object? apiUrl = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: isFailed == freezed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: noUse == freezed
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: responseMsg == freezed
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      skip: skip == freezed
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      orderHistory: orderHistory == freezed
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderWithHistoryDto>,
      placeOrderRepository: placeOrderRepository == freezed
          ? _value.placeOrderRepository
          : placeOrderRepository // ignore: cast_nullable_to_non_nullable
              as PlaceOrderRepository,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as BrandUserDto,
      appStateNotifier: appStateNotifier == freezed
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $BrandUserDtoCopyWith<$Res> get profile {
    return $BrandUserDtoCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc
abstract class _$$_CustomerPurchaseDealsDetailsStateCopyWith<$Res>
    implements $CustomerPurchaseDealsDetailsStateCopyWith<$Res> {
  factory _$$_CustomerPurchaseDealsDetailsStateCopyWith(
          _$_CustomerPurchaseDealsDetailsState value,
          $Res Function(_$_CustomerPurchaseDealsDetailsState) then) =
      __$$_CustomerPurchaseDealsDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccess,
      bool noUse,
      bool hasMore,
      String responseMsg,
      String serverUrl,
      String customerId,
      String name,
      int skip,
      ScrollController scrollController,
      List<CustomerOrderWithHistoryDto> orderHistory,
      PlaceOrderRepository placeOrderRepository,
      BrandUserDto profile,
      AppStateNotifier appStateNotifier,
      String apiUrl});

  @override
  $BrandUserDtoCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_CustomerPurchaseDealsDetailsStateCopyWithImpl<$Res>
    extends _$CustomerPurchaseDealsDetailsStateCopyWithImpl<$Res>
    implements _$$_CustomerPurchaseDealsDetailsStateCopyWith<$Res> {
  __$$_CustomerPurchaseDealsDetailsStateCopyWithImpl(
      _$_CustomerPurchaseDealsDetailsState _value,
      $Res Function(_$_CustomerPurchaseDealsDetailsState) _then)
      : super(_value, (v) => _then(v as _$_CustomerPurchaseDealsDetailsState));

  @override
  _$_CustomerPurchaseDealsDetailsState get _value =>
      super._value as _$_CustomerPurchaseDealsDetailsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
    Object? noUse = freezed,
    Object? hasMore = freezed,
    Object? responseMsg = freezed,
    Object? serverUrl = freezed,
    Object? customerId = freezed,
    Object? name = freezed,
    Object? skip = freezed,
    Object? scrollController = freezed,
    Object? orderHistory = freezed,
    Object? placeOrderRepository = freezed,
    Object? profile = freezed,
    Object? appStateNotifier = freezed,
    Object? apiUrl = freezed,
  }) {
    return _then(_$_CustomerPurchaseDealsDetailsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: isFailed == freezed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      noUse: noUse == freezed
          ? _value.noUse
          : noUse // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMore: hasMore == freezed
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      responseMsg: responseMsg == freezed
          ? _value.responseMsg
          : responseMsg // ignore: cast_nullable_to_non_nullable
              as String,
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: customerId == freezed
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      skip: skip == freezed
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      orderHistory: orderHistory == freezed
          ? _value.orderHistory
          : orderHistory // ignore: cast_nullable_to_non_nullable
              as List<CustomerOrderWithHistoryDto>,
      placeOrderRepository: placeOrderRepository == freezed
          ? _value.placeOrderRepository
          : placeOrderRepository // ignore: cast_nullable_to_non_nullable
              as PlaceOrderRepository,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as BrandUserDto,
      appStateNotifier: appStateNotifier == freezed
          ? _value.appStateNotifier
          : appStateNotifier // ignore: cast_nullable_to_non_nullable
              as AppStateNotifier,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerPurchaseDealsDetailsState
    implements _CustomerPurchaseDealsDetailsState {
  const _$_CustomerPurchaseDealsDetailsState(
      {required this.isLoading,
      required this.isFailed,
      required this.isSuccess,
      required this.noUse,
      required this.hasMore,
      required this.responseMsg,
      required this.serverUrl,
      required this.customerId,
      required this.name,
      required this.skip,
      required this.scrollController,
      required this.orderHistory,
      required this.placeOrderRepository,
      required this.profile,
      required this.appStateNotifier,
      required this.apiUrl});

  @override
  final bool isLoading;
  @override
  final bool isFailed;
  @override
  final bool isSuccess;
  @override
  final bool noUse;
  @override
  final bool hasMore;
  @override
  final String responseMsg;
  @override
  final String serverUrl;
  @override
  final String customerId;
  @override
  final String name;
  @override
  final int skip;
  @override
  final ScrollController scrollController;
  @override
  final List<CustomerOrderWithHistoryDto> orderHistory;
  @override
  final PlaceOrderRepository placeOrderRepository;
  @override
  final BrandUserDto profile;
  @override
  final AppStateNotifier appStateNotifier;
  @override
  final String apiUrl;

  @override
  String toString() {
    return 'CustomerPurchaseDealsDetailsState(isLoading: $isLoading, isFailed: $isFailed, isSuccess: $isSuccess, noUse: $noUse, hasMore: $hasMore, responseMsg: $responseMsg, serverUrl: $serverUrl, customerId: $customerId, name: $name, skip: $skip, scrollController: $scrollController, orderHistory: $orderHistory, placeOrderRepository: $placeOrderRepository, profile: $profile, appStateNotifier: $appStateNotifier, apiUrl: $apiUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerPurchaseDealsDetailsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isFailed, isFailed) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.noUse, noUse) &&
            const DeepCollectionEquality().equals(other.hasMore, hasMore) &&
            const DeepCollectionEquality()
                .equals(other.responseMsg, responseMsg) &&
            const DeepCollectionEquality().equals(other.serverUrl, serverUrl) &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.skip, skip) &&
            const DeepCollectionEquality()
                .equals(other.scrollController, scrollController) &&
            const DeepCollectionEquality()
                .equals(other.orderHistory, orderHistory) &&
            const DeepCollectionEquality()
                .equals(other.placeOrderRepository, placeOrderRepository) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            const DeepCollectionEquality()
                .equals(other.appStateNotifier, appStateNotifier) &&
            const DeepCollectionEquality().equals(other.apiUrl, apiUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isFailed),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(noUse),
      const DeepCollectionEquality().hash(hasMore),
      const DeepCollectionEquality().hash(responseMsg),
      const DeepCollectionEquality().hash(serverUrl),
      const DeepCollectionEquality().hash(customerId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(skip),
      const DeepCollectionEquality().hash(scrollController),
      const DeepCollectionEquality().hash(orderHistory),
      const DeepCollectionEquality().hash(placeOrderRepository),
      const DeepCollectionEquality().hash(profile),
      const DeepCollectionEquality().hash(appStateNotifier),
      const DeepCollectionEquality().hash(apiUrl));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerPurchaseDealsDetailsStateCopyWith<
          _$_CustomerPurchaseDealsDetailsState>
      get copyWith => __$$_CustomerPurchaseDealsDetailsStateCopyWithImpl<
          _$_CustomerPurchaseDealsDetailsState>(this, _$identity);
}

abstract class _CustomerPurchaseDealsDetailsState
    implements CustomerPurchaseDealsDetailsState {
  const factory _CustomerPurchaseDealsDetailsState(
      {required final bool isLoading,
      required final bool isFailed,
      required final bool isSuccess,
      required final bool noUse,
      required final bool hasMore,
      required final String responseMsg,
      required final String serverUrl,
      required final String customerId,
      required final String name,
      required final int skip,
      required final ScrollController scrollController,
      required final List<CustomerOrderWithHistoryDto> orderHistory,
      required final PlaceOrderRepository placeOrderRepository,
      required final BrandUserDto profile,
      required final AppStateNotifier appStateNotifier,
      required final String apiUrl}) = _$_CustomerPurchaseDealsDetailsState;

  @override
  bool get isLoading;
  @override
  bool get isFailed;
  @override
  bool get isSuccess;
  @override
  bool get noUse;
  @override
  bool get hasMore;
  @override
  String get responseMsg;
  @override
  String get serverUrl;
  @override
  String get customerId;
  @override
  String get name;
  @override
  int get skip;
  @override
  ScrollController get scrollController;
  @override
  List<CustomerOrderWithHistoryDto> get orderHistory;
  @override
  PlaceOrderRepository get placeOrderRepository;
  @override
  BrandUserDto get profile;
  @override
  AppStateNotifier get appStateNotifier;
  @override
  String get apiUrl;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerPurchaseDealsDetailsStateCopyWith<
          _$_CustomerPurchaseDealsDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}
