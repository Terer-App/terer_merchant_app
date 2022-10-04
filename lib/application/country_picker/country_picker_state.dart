part of 'country_picker_bloc.dart';

@freezed
class CountryPickerState with _$CountryPickerState {
  const factory CountryPickerState({
    required String selectedCountryName,
    required String selectedCountryDialCode,
    required String selectedCountryLocale,
    required String searchText,
    required List<Map<String, dynamic>> countryList,
    required List<Map<String, dynamic>> tempCountryList,

    // desktop
    required TextEditingController searchController,
  }) = _CountryPickerState;

  factory CountryPickerState.initial(
      {required String selectedCountryDialCode}) {
    Map<String, dynamic> selectedCountry = country.firstWhere(
      (element) => element['dial_code'] == selectedCountryDialCode,
      orElse: () => country[0],
    );

    return CountryPickerState(
        selectedCountryName: selectedCountry['name']!,
        selectedCountryDialCode: selectedCountry['dial_code']!,
        selectedCountryLocale: selectedCountry['locale']!,
        searchText: '',
        searchController: TextEditingController(),
        countryList: country,
        tempCountryList: country);
  }
}
