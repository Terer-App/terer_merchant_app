// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'live_deal_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LiveDealDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function(LiveDealDetailsState state) emitFromAnywhere,
    required TResult Function(String productId) onVariantChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
    required TResult Function(_OnVariantChange value) onVariantChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveDealDetailsEventCopyWith<$Res> {
  factory $LiveDealDetailsEventCopyWith(LiveDealDetailsEvent value,
          $Res Function(LiveDealDetailsEvent) then) =
      _$LiveDealDetailsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LiveDealDetailsEventCopyWithImpl<$Res>
    implements $LiveDealDetailsEventCopyWith<$Res> {
  _$LiveDealDetailsEventCopyWithImpl(this._value, this._then);

  final LiveDealDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(LiveDealDetailsEvent) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$LiveDealDetailsEventCopyWithImpl<$Res>
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
    return 'LiveDealDetailsEvent.init()';
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
    required TResult Function(LiveDealDetailsState state) emitFromAnywhere,
    required TResult Function(String productId) onVariantChange,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
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
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
    required TResult Function(_OnVariantChange value) onVariantChange,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements LiveDealDetailsEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_OnLoadCopyWith<$Res> {
  factory _$$_OnLoadCopyWith(_$_OnLoad value, $Res Function(_$_OnLoad) then) =
      __$$_OnLoadCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnLoadCopyWithImpl<$Res>
    extends _$LiveDealDetailsEventCopyWithImpl<$Res>
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
    return 'LiveDealDetailsEvent.onLoad()';
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
    required TResult Function(LiveDealDetailsState state) emitFromAnywhere,
    required TResult Function(String productId) onVariantChange,
  }) {
    return onLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
  }) {
    return onLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
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
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
    required TResult Function(_OnVariantChange value) onVariantChange,
  }) {
    return onLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
  }) {
    return onLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
    required TResult orElse(),
  }) {
    if (onLoad != null) {
      return onLoad(this);
    }
    return orElse();
  }
}

abstract class _OnLoad implements LiveDealDetailsEvent {
  const factory _OnLoad() = _$_OnLoad;
}

/// @nodoc
abstract class _$$_EmitFromAnywhereCopyWith<$Res> {
  factory _$$_EmitFromAnywhereCopyWith(
          _$_EmitFromAnywhere value, $Res Function(_$_EmitFromAnywhere) then) =
      __$$_EmitFromAnywhereCopyWithImpl<$Res>;
  $Res call({LiveDealDetailsState state});

  $LiveDealDetailsStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_EmitFromAnywhereCopyWithImpl<$Res>
    extends _$LiveDealDetailsEventCopyWithImpl<$Res>
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
              as LiveDealDetailsState,
    ));
  }

  @override
  $LiveDealDetailsStateCopyWith<$Res> get state {
    return $LiveDealDetailsStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_EmitFromAnywhere implements _EmitFromAnywhere {
  const _$_EmitFromAnywhere({required this.state});

  @override
  final LiveDealDetailsState state;

  @override
  String toString() {
    return 'LiveDealDetailsEvent.emitFromAnywhere(state: $state)';
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
    required TResult Function(LiveDealDetailsState state) emitFromAnywhere,
    required TResult Function(String productId) onVariantChange,
  }) {
    return emitFromAnywhere(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
  }) {
    return emitFromAnywhere?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
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
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
    required TResult Function(_OnVariantChange value) onVariantChange,
  }) {
    return emitFromAnywhere(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
  }) {
    return emitFromAnywhere?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
    required TResult orElse(),
  }) {
    if (emitFromAnywhere != null) {
      return emitFromAnywhere(this);
    }
    return orElse();
  }
}

abstract class _EmitFromAnywhere implements LiveDealDetailsEvent {
  const factory _EmitFromAnywhere({required final LiveDealDetailsState state}) =
      _$_EmitFromAnywhere;

  LiveDealDetailsState get state;
  @JsonKey(ignore: true)
  _$$_EmitFromAnywhereCopyWith<_$_EmitFromAnywhere> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnVariantChangeCopyWith<$Res> {
  factory _$$_OnVariantChangeCopyWith(
          _$_OnVariantChange value, $Res Function(_$_OnVariantChange) then) =
      __$$_OnVariantChangeCopyWithImpl<$Res>;
  $Res call({String productId});
}

/// @nodoc
class __$$_OnVariantChangeCopyWithImpl<$Res>
    extends _$LiveDealDetailsEventCopyWithImpl<$Res>
    implements _$$_OnVariantChangeCopyWith<$Res> {
  __$$_OnVariantChangeCopyWithImpl(
      _$_OnVariantChange _value, $Res Function(_$_OnVariantChange) _then)
      : super(_value, (v) => _then(v as _$_OnVariantChange));

  @override
  _$_OnVariantChange get _value => super._value as _$_OnVariantChange;

  @override
  $Res call({
    Object? productId = freezed,
  }) {
    return _then(_$_OnVariantChange(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnVariantChange implements _OnVariantChange {
  const _$_OnVariantChange({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'LiveDealDetailsEvent.onVariantChange(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnVariantChange &&
            const DeepCollectionEquality().equals(other.productId, productId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(productId));

  @JsonKey(ignore: true)
  @override
  _$$_OnVariantChangeCopyWith<_$_OnVariantChange> get copyWith =>
      __$$_OnVariantChangeCopyWithImpl<_$_OnVariantChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() onLoad,
    required TResult Function(LiveDealDetailsState state) emitFromAnywhere,
    required TResult Function(String productId) onVariantChange,
  }) {
    return onVariantChange(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
  }) {
    return onVariantChange?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? onLoad,
    TResult Function(LiveDealDetailsState state)? emitFromAnywhere,
    TResult Function(String productId)? onVariantChange,
    required TResult orElse(),
  }) {
    if (onVariantChange != null) {
      return onVariantChange(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_OnLoad value) onLoad,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
    required TResult Function(_OnVariantChange value) onVariantChange,
  }) {
    return onVariantChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
  }) {
    return onVariantChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_OnLoad value)? onLoad,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    TResult Function(_OnVariantChange value)? onVariantChange,
    required TResult orElse(),
  }) {
    if (onVariantChange != null) {
      return onVariantChange(this);
    }
    return orElse();
  }
}

abstract class _OnVariantChange implements LiveDealDetailsEvent {
  const factory _OnVariantChange({required final String productId}) =
      _$_OnVariantChange;

  String get productId;
  @JsonKey(ignore: true)
  _$$_OnVariantChangeCopyWith<_$_OnVariantChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LiveDealDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get noUse => throw _privateConstructorUsedError;
  String get serverUrl => throw _privateConstructorUsedError;
  String get apiUrl => throw _privateConstructorUsedError;
  ShopMerchantRepository get shopMerchantRepository =>
      throw _privateConstructorUsedError;
  OutletProductDto get dealDetails => throw _privateConstructorUsedError;
  ProductVariantDto? get selectedVariant => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LiveDealDetailsStateCopyWith<LiveDealDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveDealDetailsStateCopyWith<$Res> {
  factory $LiveDealDetailsStateCopyWith(LiveDealDetailsState value,
          $Res Function(LiveDealDetailsState) then) =
      _$LiveDealDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccess,
      bool noUse,
      String serverUrl,
      String apiUrl,
      ShopMerchantRepository shopMerchantRepository,
      OutletProductDto dealDetails,
      ProductVariantDto? selectedVariant});

  $OutletProductDtoCopyWith<$Res> get dealDetails;
  $ProductVariantDtoCopyWith<$Res>? get selectedVariant;
}

/// @nodoc
class _$LiveDealDetailsStateCopyWithImpl<$Res>
    implements $LiveDealDetailsStateCopyWith<$Res> {
  _$LiveDealDetailsStateCopyWithImpl(this._value, this._then);

  final LiveDealDetailsState _value;
  // ignore: unused_field
  final $Res Function(LiveDealDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
    Object? noUse = freezed,
    Object? serverUrl = freezed,
    Object? apiUrl = freezed,
    Object? shopMerchantRepository = freezed,
    Object? dealDetails = freezed,
    Object? selectedVariant = freezed,
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
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      shopMerchantRepository: shopMerchantRepository == freezed
          ? _value.shopMerchantRepository
          : shopMerchantRepository // ignore: cast_nullable_to_non_nullable
              as ShopMerchantRepository,
      dealDetails: dealDetails == freezed
          ? _value.dealDetails
          : dealDetails // ignore: cast_nullable_to_non_nullable
              as OutletProductDto,
      selectedVariant: selectedVariant == freezed
          ? _value.selectedVariant
          : selectedVariant // ignore: cast_nullable_to_non_nullable
              as ProductVariantDto?,
    ));
  }

  @override
  $OutletProductDtoCopyWith<$Res> get dealDetails {
    return $OutletProductDtoCopyWith<$Res>(_value.dealDetails, (value) {
      return _then(_value.copyWith(dealDetails: value));
    });
  }

  @override
  $ProductVariantDtoCopyWith<$Res>? get selectedVariant {
    if (_value.selectedVariant == null) {
      return null;
    }

    return $ProductVariantDtoCopyWith<$Res>(_value.selectedVariant!, (value) {
      return _then(_value.copyWith(selectedVariant: value));
    });
  }
}

/// @nodoc
abstract class _$$_LiveDealDetailsStateCopyWith<$Res>
    implements $LiveDealDetailsStateCopyWith<$Res> {
  factory _$$_LiveDealDetailsStateCopyWith(_$_LiveDealDetailsState value,
          $Res Function(_$_LiveDealDetailsState) then) =
      __$$_LiveDealDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isFailed,
      bool isSuccess,
      bool noUse,
      String serverUrl,
      String apiUrl,
      ShopMerchantRepository shopMerchantRepository,
      OutletProductDto dealDetails,
      ProductVariantDto? selectedVariant});

  @override
  $OutletProductDtoCopyWith<$Res> get dealDetails;
  @override
  $ProductVariantDtoCopyWith<$Res>? get selectedVariant;
}

/// @nodoc
class __$$_LiveDealDetailsStateCopyWithImpl<$Res>
    extends _$LiveDealDetailsStateCopyWithImpl<$Res>
    implements _$$_LiveDealDetailsStateCopyWith<$Res> {
  __$$_LiveDealDetailsStateCopyWithImpl(_$_LiveDealDetailsState _value,
      $Res Function(_$_LiveDealDetailsState) _then)
      : super(_value, (v) => _then(v as _$_LiveDealDetailsState));

  @override
  _$_LiveDealDetailsState get _value => super._value as _$_LiveDealDetailsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
    Object? noUse = freezed,
    Object? serverUrl = freezed,
    Object? apiUrl = freezed,
    Object? shopMerchantRepository = freezed,
    Object? dealDetails = freezed,
    Object? selectedVariant = freezed,
  }) {
    return _then(_$_LiveDealDetailsState(
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
      serverUrl: serverUrl == freezed
          ? _value.serverUrl
          : serverUrl // ignore: cast_nullable_to_non_nullable
              as String,
      apiUrl: apiUrl == freezed
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      shopMerchantRepository: shopMerchantRepository == freezed
          ? _value.shopMerchantRepository
          : shopMerchantRepository // ignore: cast_nullable_to_non_nullable
              as ShopMerchantRepository,
      dealDetails: dealDetails == freezed
          ? _value.dealDetails
          : dealDetails // ignore: cast_nullable_to_non_nullable
              as OutletProductDto,
      selectedVariant: selectedVariant == freezed
          ? _value.selectedVariant
          : selectedVariant // ignore: cast_nullable_to_non_nullable
              as ProductVariantDto?,
    ));
  }
}

/// @nodoc

class _$_LiveDealDetailsState implements _LiveDealDetailsState {
  const _$_LiveDealDetailsState(
      {required this.isLoading,
      required this.isFailed,
      required this.isSuccess,
      required this.noUse,
      required this.serverUrl,
      required this.apiUrl,
      required this.shopMerchantRepository,
      required this.dealDetails,
      this.selectedVariant});

  @override
  final bool isLoading;
  @override
  final bool isFailed;
  @override
  final bool isSuccess;
  @override
  final bool noUse;
  @override
  final String serverUrl;
  @override
  final String apiUrl;
  @override
  final ShopMerchantRepository shopMerchantRepository;
  @override
  final OutletProductDto dealDetails;
  @override
  final ProductVariantDto? selectedVariant;

  @override
  String toString() {
    return 'LiveDealDetailsState(isLoading: $isLoading, isFailed: $isFailed, isSuccess: $isSuccess, noUse: $noUse, serverUrl: $serverUrl, apiUrl: $apiUrl, shopMerchantRepository: $shopMerchantRepository, dealDetails: $dealDetails, selectedVariant: $selectedVariant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LiveDealDetailsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isFailed, isFailed) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.noUse, noUse) &&
            const DeepCollectionEquality().equals(other.serverUrl, serverUrl) &&
            const DeepCollectionEquality().equals(other.apiUrl, apiUrl) &&
            const DeepCollectionEquality()
                .equals(other.shopMerchantRepository, shopMerchantRepository) &&
            const DeepCollectionEquality()
                .equals(other.dealDetails, dealDetails) &&
            const DeepCollectionEquality()
                .equals(other.selectedVariant, selectedVariant));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isFailed),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(noUse),
      const DeepCollectionEquality().hash(serverUrl),
      const DeepCollectionEquality().hash(apiUrl),
      const DeepCollectionEquality().hash(shopMerchantRepository),
      const DeepCollectionEquality().hash(dealDetails),
      const DeepCollectionEquality().hash(selectedVariant));

  @JsonKey(ignore: true)
  @override
  _$$_LiveDealDetailsStateCopyWith<_$_LiveDealDetailsState> get copyWith =>
      __$$_LiveDealDetailsStateCopyWithImpl<_$_LiveDealDetailsState>(
          this, _$identity);
}

abstract class _LiveDealDetailsState implements LiveDealDetailsState {
  const factory _LiveDealDetailsState(
      {required final bool isLoading,
      required final bool isFailed,
      required final bool isSuccess,
      required final bool noUse,
      required final String serverUrl,
      required final String apiUrl,
      required final ShopMerchantRepository shopMerchantRepository,
      required final OutletProductDto dealDetails,
      final ProductVariantDto? selectedVariant}) = _$_LiveDealDetailsState;

  @override
  bool get isLoading;
  @override
  bool get isFailed;
  @override
  bool get isSuccess;
  @override
  bool get noUse;
  @override
  String get serverUrl;
  @override
  String get apiUrl;
  @override
  ShopMerchantRepository get shopMerchantRepository;
  @override
  OutletProductDto get dealDetails;
  @override
  ProductVariantDto? get selectedVariant;
  @override
  @JsonKey(ignore: true)
  _$$_LiveDealDetailsStateCopyWith<_$_LiveDealDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
