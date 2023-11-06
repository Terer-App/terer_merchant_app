// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'featured_image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeaturedImageDto _$FeaturedImageDtoFromJson(Map<String, dynamic> json) {
  return _FeaturedImageDto.fromJson(json);
}

/// @nodoc
mixin _$FeaturedImageDto {
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturedImageDtoCopyWith<FeaturedImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturedImageDtoCopyWith<$Res> {
  factory $FeaturedImageDtoCopyWith(
          FeaturedImageDto value, $Res Function(FeaturedImageDto) then) =
      _$FeaturedImageDtoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'url') String url});
}

/// @nodoc
class _$FeaturedImageDtoCopyWithImpl<$Res>
    implements $FeaturedImageDtoCopyWith<$Res> {
  _$FeaturedImageDtoCopyWithImpl(this._value, this._then);

  final FeaturedImageDto _value;
  // ignore: unused_field
  final $Res Function(FeaturedImageDto) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FeaturedImageDtoCopyWith<$Res>
    implements $FeaturedImageDtoCopyWith<$Res> {
  factory _$$_FeaturedImageDtoCopyWith(
          _$_FeaturedImageDto value, $Res Function(_$_FeaturedImageDto) then) =
      __$$_FeaturedImageDtoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$_FeaturedImageDtoCopyWithImpl<$Res>
    extends _$FeaturedImageDtoCopyWithImpl<$Res>
    implements _$$_FeaturedImageDtoCopyWith<$Res> {
  __$$_FeaturedImageDtoCopyWithImpl(
      _$_FeaturedImageDto _value, $Res Function(_$_FeaturedImageDto) _then)
      : super(_value, (v) => _then(v as _$_FeaturedImageDto));

  @override
  _$_FeaturedImageDto get _value => super._value as _$_FeaturedImageDto;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$_FeaturedImageDto(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeaturedImageDto implements _FeaturedImageDto {
  const _$_FeaturedImageDto({@JsonKey(name: 'url') required this.url});

  factory _$_FeaturedImageDto.fromJson(Map<String, dynamic> json) =>
      _$$_FeaturedImageDtoFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'FeaturedImageDto(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeaturedImageDto &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_FeaturedImageDtoCopyWith<_$_FeaturedImageDto> get copyWith =>
      __$$_FeaturedImageDtoCopyWithImpl<_$_FeaturedImageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeaturedImageDtoToJson(
      this,
    );
  }
}

abstract class _FeaturedImageDto implements FeaturedImageDto {
  const factory _FeaturedImageDto(
      {@JsonKey(name: 'url') required final String url}) = _$_FeaturedImageDto;

  factory _FeaturedImageDto.fromJson(Map<String, dynamic> json) =
      _$_FeaturedImageDto.fromJson;

  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_FeaturedImageDtoCopyWith<_$_FeaturedImageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
