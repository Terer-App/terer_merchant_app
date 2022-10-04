part of 'country_picker_bloc.dart';

@freezed
class CountryPickerEvent with _$CountryPickerEvent {
  const factory CountryPickerEvent.searchCountry({required String value}) =
      _SearchCountry;
}
