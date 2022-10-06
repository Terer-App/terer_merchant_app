// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) changePage,
    required TResult Function(HomeScreenState state) emitFromAnyWhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_EmitFromAnyWhere value) emitFromAnyWhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenEventCopyWith<$Res> {
  factory $HomeScreenEventCopyWith(
          HomeScreenEvent value, $Res Function(HomeScreenEvent) then) =
      _$HomeScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeScreenEventCopyWithImpl<$Res>
    implements $HomeScreenEventCopyWith<$Res> {
  _$HomeScreenEventCopyWithImpl(this._value, this._then);

  final HomeScreenEvent _value;
  // ignore: unused_field
  final $Res Function(HomeScreenEvent) _then;
}

/// @nodoc
abstract class _$$_ChangePageCopyWith<$Res> {
  factory _$$_ChangePageCopyWith(
          _$_ChangePage value, $Res Function(_$_ChangePage) then) =
      __$$_ChangePageCopyWithImpl<$Res>;
  $Res call({int currentPage});
}

/// @nodoc
class __$$_ChangePageCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$$_ChangePageCopyWith<$Res> {
  __$$_ChangePageCopyWithImpl(
      _$_ChangePage _value, $Res Function(_$_ChangePage) _then)
      : super(_value, (v) => _then(v as _$_ChangePage));

  @override
  _$_ChangePage get _value => super._value as _$_ChangePage;

  @override
  $Res call({
    Object? currentPage = freezed,
  }) {
    return _then(_$_ChangePage(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangePage implements _ChangePage {
  const _$_ChangePage({required this.currentPage});

  @override
  final int currentPage;

  @override
  String toString() {
    return 'HomeScreenEvent.changePage(currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangePage &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      __$$_ChangePageCopyWithImpl<_$_ChangePage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) changePage,
    required TResult Function(HomeScreenState state) emitFromAnyWhere,
  }) {
    return changePage(currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
  }) {
    return changePage?.call(currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_EmitFromAnyWhere value) emitFromAnyWhere,
  }) {
    return changePage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
  }) {
    return changePage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
    required TResult orElse(),
  }) {
    if (changePage != null) {
      return changePage(this);
    }
    return orElse();
  }
}

abstract class _ChangePage implements HomeScreenEvent {
  const factory _ChangePage({required final int currentPage}) = _$_ChangePage;

  int get currentPage;
  @JsonKey(ignore: true)
  _$$_ChangePageCopyWith<_$_ChangePage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmitFromAnyWhereCopyWith<$Res> {
  factory _$$_EmitFromAnyWhereCopyWith(
          _$_EmitFromAnyWhere value, $Res Function(_$_EmitFromAnyWhere) then) =
      __$$_EmitFromAnyWhereCopyWithImpl<$Res>;
  $Res call({HomeScreenState state});

  $HomeScreenStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$_EmitFromAnyWhereCopyWithImpl<$Res>
    extends _$HomeScreenEventCopyWithImpl<$Res>
    implements _$$_EmitFromAnyWhereCopyWith<$Res> {
  __$$_EmitFromAnyWhereCopyWithImpl(
      _$_EmitFromAnyWhere _value, $Res Function(_$_EmitFromAnyWhere) _then)
      : super(_value, (v) => _then(v as _$_EmitFromAnyWhere));

  @override
  _$_EmitFromAnyWhere get _value => super._value as _$_EmitFromAnyWhere;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_$_EmitFromAnyWhere(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as HomeScreenState,
    ));
  }

  @override
  $HomeScreenStateCopyWith<$Res> get state {
    return $HomeScreenStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$_EmitFromAnyWhere implements _EmitFromAnyWhere {
  const _$_EmitFromAnyWhere({required this.state});

  @override
  final HomeScreenState state;

  @override
  String toString() {
    return 'HomeScreenEvent.emitFromAnyWhere(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmitFromAnyWhere &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$$_EmitFromAnyWhereCopyWith<_$_EmitFromAnyWhere> get copyWith =>
      __$$_EmitFromAnyWhereCopyWithImpl<_$_EmitFromAnyWhere>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int currentPage) changePage,
    required TResult Function(HomeScreenState state) emitFromAnyWhere,
  }) {
    return emitFromAnyWhere(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
  }) {
    return emitFromAnyWhere?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int currentPage)? changePage,
    TResult Function(HomeScreenState state)? emitFromAnyWhere,
    required TResult orElse(),
  }) {
    if (emitFromAnyWhere != null) {
      return emitFromAnyWhere(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangePage value) changePage,
    required TResult Function(_EmitFromAnyWhere value) emitFromAnyWhere,
  }) {
    return emitFromAnyWhere(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
  }) {
    return emitFromAnyWhere?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangePage value)? changePage,
    TResult Function(_EmitFromAnyWhere value)? emitFromAnyWhere,
    required TResult orElse(),
  }) {
    if (emitFromAnyWhere != null) {
      return emitFromAnyWhere(this);
    }
    return orElse();
  }
}

abstract class _EmitFromAnyWhere implements HomeScreenEvent {
  const factory _EmitFromAnyWhere({required final HomeScreenState state}) =
      _$_EmitFromAnyWhere;

  HomeScreenState get state;
  @JsonKey(ignore: true)
  _$$_EmitFromAnyWhereCopyWith<_$_EmitFromAnyWhere> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get showBottom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, int currentPage, bool showBottom});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentPage = freezed,
    Object? showBottom = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      showBottom: showBottom == freezed
          ? _value.showBottom
          : showBottom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeScreenStateCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$$_HomeScreenStateCopyWith(
          _$_HomeScreenState value, $Res Function(_$_HomeScreenState) then) =
      __$$_HomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, int currentPage, bool showBottom});
}

/// @nodoc
class __$$_HomeScreenStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$$_HomeScreenStateCopyWith<$Res> {
  __$$_HomeScreenStateCopyWithImpl(
      _$_HomeScreenState _value, $Res Function(_$_HomeScreenState) _then)
      : super(_value, (v) => _then(v as _$_HomeScreenState));

  @override
  _$_HomeScreenState get _value => super._value as _$_HomeScreenState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentPage = freezed,
    Object? showBottom = freezed,
  }) {
    return _then(_$_HomeScreenState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      showBottom: showBottom == freezed
          ? _value.showBottom
          : showBottom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeScreenState implements _HomeScreenState {
  const _$_HomeScreenState(
      {required this.isLoading,
      required this.currentPage,
      required this.showBottom});

  @override
  final bool isLoading;
  @override
  final int currentPage;
  @override
  final bool showBottom;

  @override
  String toString() {
    return 'HomeScreenState(isLoading: $isLoading, currentPage: $currentPage, showBottom: $showBottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeScreenState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage) &&
            const DeepCollectionEquality()
                .equals(other.showBottom, showBottom));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(currentPage),
      const DeepCollectionEquality().hash(showBottom));

  @JsonKey(ignore: true)
  @override
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      __$$_HomeScreenStateCopyWithImpl<_$_HomeScreenState>(this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState(
      {required final bool isLoading,
      required final int currentPage,
      required final bool showBottom}) = _$_HomeScreenState;

  @override
  bool get isLoading;
  @override
  int get currentPage;
  @override
  bool get showBottom;
  @override
  @JsonKey(ignore: true)
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
