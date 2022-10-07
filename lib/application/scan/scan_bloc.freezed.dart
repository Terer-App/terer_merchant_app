// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ScanState state) emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanEventCopyWith<$Res> {
  factory $ScanEventCopyWith(ScanEvent value, $Res Function(ScanEvent) then) =
      _$ScanEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanEventCopyWithImpl<$Res> implements $ScanEventCopyWith<$Res> {
  _$ScanEventCopyWithImpl(this._value, this._then);

  final ScanEvent _value;
  // ignore: unused_field
  final $Res Function(ScanEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$ScanEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ScanEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ScanState state) emitFromAnywhere,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ScanEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_EmitFromAnywhereCopyWith<$Res> {
  factory _$$_EmitFromAnywhereCopyWith(
          _$_EmitFromAnywhere value, $Res Function(_$_EmitFromAnywhere) then) =
      __$$_EmitFromAnywhereCopyWithImpl<$Res>;
  $Res call({ScanState state});

  $ScanStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_EmitFromAnywhereCopyWithImpl<$Res>
    extends _$ScanEventCopyWithImpl<$Res>
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
              as ScanState,
    ));
  }

  @override
  $ScanStateCopyWith<$Res> get state {
    return $ScanStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_EmitFromAnywhere implements _EmitFromAnywhere {
  const _$_EmitFromAnywhere({required this.state});

  @override
  final ScanState state;

  @override
  String toString() {
    return 'ScanEvent.emitFromAnywhere(state: $state)';
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
    required TResult Function() started,
    required TResult Function(ScanState state) emitFromAnywhere,
  }) {
    return emitFromAnywhere(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
  }) {
    return emitFromAnywhere?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ScanState state)? emitFromAnywhere,
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
    required TResult Function(_Started value) started,
    required TResult Function(_EmitFromAnywhere value) emitFromAnywhere,
  }) {
    return emitFromAnywhere(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
  }) {
    return emitFromAnywhere?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EmitFromAnywhere value)? emitFromAnywhere,
    required TResult orElse(),
  }) {
    if (emitFromAnywhere != null) {
      return emitFromAnywhere(this);
    }
    return orElse();
  }
}

abstract class _EmitFromAnywhere implements ScanEvent {
  const factory _EmitFromAnywhere({required final ScanState state}) =
      _$_EmitFromAnywhere;

  ScanState get state;
  @JsonKey(ignore: true)
  _$$_EmitFromAnywhereCopyWith<_$_EmitFromAnywhere> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScanState {
  bool get isLoading => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>> get qrKey =>
      throw _privateConstructorUsedError;
  Barcode? get result => throw _privateConstructorUsedError;
  QRViewController? get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScanStateCopyWith<ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanStateCopyWith<$Res> {
  factory $ScanStateCopyWith(ScanState value, $Res Function(ScanState) then) =
      _$ScanStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      GlobalKey<State<StatefulWidget>> qrKey,
      Barcode? result,
      QRViewController? controller});
}

/// @nodoc
class _$ScanStateCopyWithImpl<$Res> implements $ScanStateCopyWith<$Res> {
  _$ScanStateCopyWithImpl(this._value, this._then);

  final ScanState _value;
  // ignore: unused_field
  final $Res Function(ScanState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? qrKey = freezed,
    Object? result = freezed,
    Object? controller = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      qrKey: qrKey == freezed
          ? _value.qrKey
          : qrKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
    ));
  }
}

/// @nodoc
abstract class _$$_ScanStateCopyWith<$Res> implements $ScanStateCopyWith<$Res> {
  factory _$$_ScanStateCopyWith(
          _$_ScanState value, $Res Function(_$_ScanState) then) =
      __$$_ScanStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      GlobalKey<State<StatefulWidget>> qrKey,
      Barcode? result,
      QRViewController? controller});
}

/// @nodoc
class __$$_ScanStateCopyWithImpl<$Res> extends _$ScanStateCopyWithImpl<$Res>
    implements _$$_ScanStateCopyWith<$Res> {
  __$$_ScanStateCopyWithImpl(
      _$_ScanState _value, $Res Function(_$_ScanState) _then)
      : super(_value, (v) => _then(v as _$_ScanState));

  @override
  _$_ScanState get _value => super._value as _$_ScanState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? qrKey = freezed,
    Object? result = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$_ScanState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      qrKey: qrKey == freezed
          ? _value.qrKey
          : qrKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Barcode?,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
    ));
  }
}

/// @nodoc

class _$_ScanState implements _ScanState {
  const _$_ScanState(
      {required this.isLoading,
      required this.qrKey,
      this.result,
      this.controller});

  @override
  final bool isLoading;
  @override
  final GlobalKey<State<StatefulWidget>> qrKey;
  @override
  final Barcode? result;
  @override
  final QRViewController? controller;

  @override
  String toString() {
    return 'ScanState(isLoading: $isLoading, qrKey: $qrKey, result: $result, controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScanState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.qrKey, qrKey) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(qrKey),
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(controller));

  @JsonKey(ignore: true)
  @override
  _$$_ScanStateCopyWith<_$_ScanState> get copyWith =>
      __$$_ScanStateCopyWithImpl<_$_ScanState>(this, _$identity);
}

abstract class _ScanState implements ScanState {
  const factory _ScanState(
      {required final bool isLoading,
      required final GlobalKey<State<StatefulWidget>> qrKey,
      final Barcode? result,
      final QRViewController? controller}) = _$_ScanState;

  @override
  bool get isLoading;
  @override
  GlobalKey<State<StatefulWidget>> get qrKey;
  @override
  Barcode? get result;
  @override
  QRViewController? get controller;
  @override
  @JsonKey(ignore: true)
  _$$_ScanStateCopyWith<_$_ScanState> get copyWith =>
      throw _privateConstructorUsedError;
}
