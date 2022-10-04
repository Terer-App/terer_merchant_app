// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routing_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutingDto _$RoutingDtoFromJson(Map<String, dynamic> json) {
  return _RoutingDto.fromJson(json);
}

/// @nodoc
class _$RoutingDtoTearOff {
  const _$RoutingDtoTearOff();

  _RoutingDto call(
      {required String route, required Map<String, String> queryParameters}) {
    return _RoutingDto(
      route: route,
      queryParameters: queryParameters,
    );
  }

  RoutingDto fromJson(Map<String, Object?> json) {
    return RoutingDto.fromJson(json);
  }
}

/// @nodoc
const $RoutingDto = _$RoutingDtoTearOff();

/// @nodoc
mixin _$RoutingDto {
  String get route => throw _privateConstructorUsedError;
  Map<String, String> get queryParameters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutingDtoCopyWith<RoutingDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutingDtoCopyWith<$Res> {
  factory $RoutingDtoCopyWith(
          RoutingDto value, $Res Function(RoutingDto) then) =
      _$RoutingDtoCopyWithImpl<$Res>;
  $Res call({String route, Map<String, String> queryParameters});
}

/// @nodoc
class _$RoutingDtoCopyWithImpl<$Res> implements $RoutingDtoCopyWith<$Res> {
  _$RoutingDtoCopyWithImpl(this._value, this._then);

  final RoutingDto _value;
  // ignore: unused_field
  final $Res Function(RoutingDto) _then;

  @override
  $Res call({
    Object? route = freezed,
    Object? queryParameters = freezed,
  }) {
    return _then(_value.copyWith(
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      queryParameters: queryParameters == freezed
          ? _value.queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$RoutingDtoCopyWith<$Res> implements $RoutingDtoCopyWith<$Res> {
  factory _$RoutingDtoCopyWith(
          _RoutingDto value, $Res Function(_RoutingDto) then) =
      __$RoutingDtoCopyWithImpl<$Res>;
  @override
  $Res call({String route, Map<String, String> queryParameters});
}

/// @nodoc
class __$RoutingDtoCopyWithImpl<$Res> extends _$RoutingDtoCopyWithImpl<$Res>
    implements _$RoutingDtoCopyWith<$Res> {
  __$RoutingDtoCopyWithImpl(
      _RoutingDto _value, $Res Function(_RoutingDto) _then)
      : super(_value, (v) => _then(v as _RoutingDto));

  @override
  _RoutingDto get _value => super._value as _RoutingDto;

  @override
  $Res call({
    Object? route = freezed,
    Object? queryParameters = freezed,
  }) {
    return _then(_RoutingDto(
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      queryParameters: queryParameters == freezed
          ? _value.queryParameters
          : queryParameters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoutingDto implements _RoutingDto {
  _$_RoutingDto({required this.route, required this.queryParameters});

  factory _$_RoutingDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoutingDtoFromJson(json);

  @override
  final String route;
  @override
  final Map<String, String> queryParameters;

  @override
  String toString() {
    return 'RoutingDto(route: $route, queryParameters: $queryParameters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutingDto &&
            const DeepCollectionEquality().equals(other.route, route) &&
            const DeepCollectionEquality()
                .equals(other.queryParameters, queryParameters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(route),
      const DeepCollectionEquality().hash(queryParameters));

  @JsonKey(ignore: true)
  @override
  _$RoutingDtoCopyWith<_RoutingDto> get copyWith =>
      __$RoutingDtoCopyWithImpl<_RoutingDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutingDtoToJson(this);
  }
}

abstract class _RoutingDto implements RoutingDto {
  factory _RoutingDto(
      {required String route,
      required Map<String, String> queryParameters}) = _$_RoutingDto;

  factory _RoutingDto.fromJson(Map<String, dynamic> json) =
      _$_RoutingDto.fromJson;

  @override
  String get route;
  @override
  Map<String, String> get queryParameters;
  @override
  @JsonKey(ignore: true)
  _$RoutingDtoCopyWith<_RoutingDto> get copyWith =>
      throw _privateConstructorUsedError;
}
