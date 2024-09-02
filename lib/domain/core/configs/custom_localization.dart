import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

class MaterialLocalizationEnCustom extends MaterialLocalizationEn {
  const MaterialLocalizationEnCustom({
    super.localeName = 'en_Custom',
    required super.fullYearFormat,
    required this.hintText,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  final String hintText;

  @override
  String get shareButtonLabel => 'Share...';

  @override
  String get lookUpButtonLabel => 'Look up';

  @override
  String get expansionTileExpandedHint => 'double-tap to collapse';

  @override
  String get expansionTileCollapsedHint => 'double-tap to expand';

  @override
  String get bottomSheetLabel => 'Bottom sheet';

  @override
  String get keyboardKeyCapsLock => 'Caps lock';

  @override
  String get keyboardKeyChannelUp => 'Channel up';

  @override
  String get keyboardKeyChannelDown => 'Channel down';

  @override
  String get keyboardKeyNumLock => 'Num lock';

  @override
  String get keyboardKeyScrollLock => 'Scroll lock';

  @override
  String get keyboardKeyPrintScreen => 'Print screen';

  @override
  String get keyboardKeyPowerOff => 'Power off';

  @override
  String get keyboardKeyNumpadEnter => 'Num enter';

  @override
  String get dateInputLabel => 'Enter date';

  @override
  String get dateRangeEndLabel => 'End date';

  @override
  String get dateRangeStartLabel => 'Start date';

  @override
  String get unspecifiedDateRange => 'Date range';

  @override
  String get dateHelpText => hintText.toLowerCase();

  @override
  String get licensesPageTitle => 'Licences';

  @override
  String? get licensesPackageDetailTextZero => 'No licences';

  @override
  String? get licensesPackageDetailTextOne => '1 licence';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount licences';

  @override
  String get viewLicensesButtonLabel => 'View licences';

  @override
  String get popupMenuLabel => 'Pop-up menu';

  @override
  String get dialogLabel => 'Dialogue';

  @override
  String get reorderItemLeft => 'Move to the left';

  @override
  String get reorderItemRight => 'Move to the right';
}

class CustomMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const CustomMaterialLocalizationsDelegate(this.format);

  final String format;

  @override
  bool isSupported(Locale locale) => 'Custom' == locale.countryCode;

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    assert(isSupported(locale));

    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
    intl.DateFormat fullYearFormat;

    intl.DateFormat shortDateFormat;
    intl.DateFormat mediumDateFormat;
    intl.DateFormat longDateFormat;
    intl.DateFormat yearMonthFormat;
    intl.DateFormat shortMonthDayFormat;
    if (intl.DateFormat.localeExists(localeName)) {
      fullYearFormat = intl.DateFormat.y(localeName);

      shortDateFormat = intl.DateFormat.yMMMd(localeName);
      mediumDateFormat = intl.DateFormat.MMMEd(localeName);
      longDateFormat = intl.DateFormat.yMMMMEEEEd(localeName);
      yearMonthFormat = intl.DateFormat.yMMMM(localeName);
      shortMonthDayFormat = intl.DateFormat.MMMd(localeName);
    } else if (intl.DateFormat.localeExists(locale.languageCode)) {
      fullYearFormat = intl.DateFormat.y(locale.languageCode);

      shortDateFormat = intl.DateFormat.yMMMd(locale.languageCode);
      mediumDateFormat = intl.DateFormat.MMMEd(locale.languageCode);
      longDateFormat = intl.DateFormat.yMMMMEEEEd(locale.languageCode);
      yearMonthFormat = intl.DateFormat.yMMMM(locale.languageCode);
      shortMonthDayFormat = intl.DateFormat.MMMd(locale.languageCode);
    } else {
      fullYearFormat = intl.DateFormat.y();
      shortDateFormat = intl.DateFormat.yMMMd();
      mediumDateFormat = intl.DateFormat.MMMEd();
      longDateFormat = intl.DateFormat.yMMMMEEEEd();
      yearMonthFormat = intl.DateFormat.yMMMM();
      shortMonthDayFormat = intl.DateFormat.MMMd();
    }

    intl.NumberFormat decimalFormat;
    intl.NumberFormat twoDigitZeroPaddedFormat;
    if (intl.NumberFormat.localeExists(localeName)) {
      decimalFormat = intl.NumberFormat.decimalPattern(localeName);
      twoDigitZeroPaddedFormat = intl.NumberFormat('00', localeName);
    } else if (intl.NumberFormat.localeExists(locale.languageCode)) {
      decimalFormat = intl.NumberFormat.decimalPattern(locale.languageCode);
      twoDigitZeroPaddedFormat = intl.NumberFormat('00', locale.languageCode);
    } else {
      decimalFormat = intl.NumberFormat.decimalPattern();
      twoDigitZeroPaddedFormat = intl.NumberFormat('00');
    }

    return SynchronousFuture<MaterialLocalizations>(MaterialLocalizationEnCustom(
      hintText: format,
      fullYearFormat: fullYearFormat,
      compactDateFormat: intl.DateFormat(format),
      shortDateFormat: shortDateFormat,
      mediumDateFormat: mediumDateFormat,
      longDateFormat: longDateFormat,
      yearMonthFormat: yearMonthFormat,
      shortMonthDayFormat: shortMonthDayFormat,
      decimalFormat: decimalFormat,
      twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
    ));
  }

  @override
  bool shouldReload(CustomMaterialLocalizationsDelegate old) => false;

  @override
  String toString() => 'CustomMaterialLocalizationsDelegate';
}
