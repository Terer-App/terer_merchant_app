// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'country_picker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountryPickerEvent {
  String get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchCountry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? searchCountry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchCountry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchCountry value) searchCountry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchCountry value)? searchCountry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchCountry value)? searchCountry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryPickerEventCopyWith<CountryPickerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryPickerEventCopyWith<$Res> {
  factory $CountryPickerEventCopyWith(
          CountryPickerEvent value, $Res Function(CountryPickerEvent) then) =
      _$CountryPickerEventCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$CountryPickerEventCopyWithImpl<$Res>
    implements $CountryPickerEventCopyWith<$Res> {
  _$CountryPickerEventCopyWithImpl(this._value, this._then);

  final CountryPickerEvent _value;
  // ignore: unused_field
  final $Res Function(CountryPickerEvent) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchCountryCopyWith<$Res>
    implements $CountryPickerEventCopyWith<$Res> {
  factory _$$_SearchCountryCopyWith(
          _$_SearchCountry value, $Res Function(_$_SearchCountry) then) =
      __$$_SearchCountryCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_SearchCountryCopyWithImpl<$Res>
    extends _$CountryPickerEventCopyWithImpl<$Res>
    implements _$$_SearchCountryCopyWith<$Res> {
  __$$_SearchCountryCopyWithImpl(
      _$_SearchCountry _value, $Res Function(_$_SearchCountry) _then)
      : super(_value, (v) => _then(v as _$_SearchCountry));

  @override
  _$_SearchCountry get _value => super._value as _$_SearchCountry;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_SearchCountry(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchCountry implements _SearchCountry {
  const _$_SearchCountry({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'CountryPickerEvent.searchCountry(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCountry &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_SearchCountryCopyWith<_$_SearchCountry> get copyWith =>
      __$$_SearchCountryCopyWithImpl<_$_SearchCountry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) searchCountry,
  }) {
    return searchCountry(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? searchCountry,
  }) {
    return searchCountry?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? searchCountry,
    required TResult orElse(),
  }) {
    if (searchCountry != null) {
      return searchCountry(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SearchCountry value) searchCountry,
  }) {
    return searchCountry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SearchCountry value)? searchCountry,
  }) {
    return searchCountry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SearchCountry value)? searchCountry,
    required TResult orElse(),
  }) {
    if (searchCountry != null) {
      return searchCountry(this);
    }
    return orElse();
  }
}

abstract class _SearchCountry implements CountryPickerEvent {
  const factory _SearchCountry({required final String value}) =
      _$_SearchCountry;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCountryCopyWith<_$_SearchCountry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CountryPickerState {
  String get selectedCountryName => throw _privateConstructorUsedError;
  String get selectedCountryDialCode => throw _privateConstructorUsedError;
  String get selectedCountryLocale => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get countryList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get tempCountryList =>
      throw _privateConstructorUsedError; // desktop
  TextEditingController get searchController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryPickerStateCopyWith<CountryPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryPickerStateCopyWith<$Res> {
  factory $CountryPickerStateCopyWith(
          CountryPickerState value, $Res Function(CountryPickerState) then) =
      _$CountryPickerStateCopyWithImpl<$Res>;
  $Res call(
      {String selectedCountryName,
      String selectedCountryDialCode,
      String selectedCountryLocale,
      String searchText,
      List<Map<String, dynamic>> countryList,
      List<Map<String, dynamic>> tempCountryList,
      TextEditingController searchController});
}

/// @nodoc
class _$CountryPickerStateCopyWithImpl<$Res>
    implements $CountryPickerStateCopyWith<$Res> {
  _$CountryPickerStateCopyWithImpl(this._value, this._then);

  final CountryPickerState _value;
  // ignore: unused_field
  final $Res Function(CountryPickerState) _then;

  @override
  $Res call({
    Object? selectedCountryName = freezed,
    Object? selectedCountryDialCode = freezed,
    Object? selectedCountryLocale = freezed,
    Object? searchText = freezed,
    Object? countryList = freezed,
    Object? tempCountryList = freezed,
    Object? searchController = freezed,
  }) {
    return _then(_value.copyWith(
      selectedCountryName: selectedCountryName == freezed
          ? _value.selectedCountryName
          : selectedCountryName // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryDialCode: selectedCountryDialCode == freezed
          ? _value.selectedCountryDialCode
          : selectedCountryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryLocale: selectedCountryLocale == freezed
          ? _value.selectedCountryLocale
          : selectedCountryLocale // ignore: cast_nullable_to_non_nullable
              as String,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      countryList: countryList == freezed
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tempCountryList: tempCountryList == freezed
          ? _value.tempCountryList
          : tempCountryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      searchController: searchController == freezed
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc
abstract class _$$_CountryPickerStateCopyWith<$Res>
    implements $CountryPickerStateCopyWith<$Res> {
  factory _$$_CountryPickerStateCopyWith(_$_CountryPickerState value,
          $Res Function(_$_CountryPickerState) then) =
      __$$_CountryPickerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String selectedCountryName,
      String selectedCountryDialCode,
      String selectedCountryLocale,
      String searchText,
      List<Map<String, dynamic>> countryList,
      List<Map<String, dynamic>> tempCountryList,
      TextEditingController searchController});
}

/// @nodoc
class __$$_CountryPickerStateCopyWithImpl<$Res>
    extends _$CountryPickerStateCopyWithImpl<$Res>
    implements _$$_CountryPickerStateCopyWith<$Res> {
  __$$_CountryPickerStateCopyWithImpl(
      _$_CountryPickerState _value, $Res Function(_$_CountryPickerState) _then)
      : super(_value, (v) => _then(v as _$_CountryPickerState));

  @override
  _$_CountryPickerState get _value => super._value as _$_CountryPickerState;

  @override
  $Res call({
    Object? selectedCountryName = freezed,
    Object? selectedCountryDialCode = freezed,
    Object? selectedCountryLocale = freezed,
    Object? searchText = freezed,
    Object? countryList = freezed,
    Object? tempCountryList = freezed,
    Object? searchController = freezed,
  }) {
    return _then(_$_CountryPickerState(
      selectedCountryName: selectedCountryName == freezed
          ? _value.selectedCountryName
          : selectedCountryName // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryDialCode: selectedCountryDialCode == freezed
          ? _value.selectedCountryDialCode
          : selectedCountryDialCode // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCountryLocale: selectedCountryLocale == freezed
          ? _value.selectedCountryLocale
          : selectedCountryLocale // ignore: cast_nullable_to_non_nullable
              as String,
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      countryList: countryList == freezed
          ? _value._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tempCountryList: tempCountryList == freezed
          ? _value._tempCountryList
          : tempCountryList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      searchController: searchController == freezed
          ? _value.searchController
          : searchController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_CountryPickerState implements _CountryPickerState {
  const _$_CountryPickerState(
      {required this.selectedCountryName,
      required this.selectedCountryDialCode,
      required this.selectedCountryLocale,
      required this.searchText,
      required final List<Map<String, dynamic>> countryList,
      required final List<Map<String, dynamic>> tempCountryList,
      required this.searchController})
      : _countryList = countryList,
        _tempCountryList = tempCountryList;

  @override
  final String selectedCountryName;
  @override
  final String selectedCountryDialCode;
  @override
  final String selectedCountryLocale;
  @override
  final String searchText;
  final List<Map<String, dynamic>> _countryList;
  @override
  List<Map<String, dynamic>> get countryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

  final List<Map<String, dynamic>> _tempCountryList;
  @override
  List<Map<String, dynamic>> get tempCountryList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tempCountryList);
  }

// desktop
  @override
  final TextEditingController searchController;

  @override
  String toString() {
    return 'CountryPickerState(selectedCountryName: $selectedCountryName, selectedCountryDialCode: $selectedCountryDialCode, selectedCountryLocale: $selectedCountryLocale, searchText: $searchText, countryList: $countryList, tempCountryList: $tempCountryList, searchController: $searchController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryPickerState &&
            const DeepCollectionEquality()
                .equals(other.selectedCountryName, selectedCountryName) &&
            const DeepCollectionEquality().equals(
                other.selectedCountryDialCode, selectedCountryDialCode) &&
            const DeepCollectionEquality()
                .equals(other.selectedCountryLocale, selectedCountryLocale) &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList) &&
            const DeepCollectionEquality()
                .equals(other._tempCountryList, _tempCountryList) &&
            const DeepCollectionEquality()
                .equals(other.searchController, searchController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedCountryName),
      const DeepCollectionEquality().hash(selectedCountryDialCode),
      const DeepCollectionEquality().hash(selectedCountryLocale),
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(_countryList),
      const DeepCollectionEquality().hash(_tempCountryList),
      const DeepCollectionEquality().hash(searchController));

  @JsonKey(ignore: true)
  @override
  _$$_CountryPickerStateCopyWith<_$_CountryPickerState> get copyWith =>
      __$$_CountryPickerStateCopyWithImpl<_$_CountryPickerState>(
          this, _$identity);
}

abstract class _CountryPickerState implements CountryPickerState {
  const factory _CountryPickerState(
          {required final String selectedCountryName,
          required final String selectedCountryDialCode,
          required final String selectedCountryLocale,
          required final String searchText,
          required final List<Map<String, dynamic>> countryList,
          required final List<Map<String, dynamic>> tempCountryList,
          required final TextEditingController searchController}) =
      _$_CountryPickerState;

  @override
  String get selectedCountryName;
  @override
  String get selectedCountryDialCode;
  @override
  String get selectedCountryLocale;
  @override
  String get searchText;
  @override
  List<Map<String, dynamic>> get countryList;
  @override
  List<Map<String, dynamic>> get tempCountryList;
  @override // desktop
  TextEditingController get searchController;
  @override
  @JsonKey(ignore: true)
  _$$_CountryPickerStateCopyWith<_$_CountryPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}
