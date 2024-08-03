import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get displayDate {
    String suffix = 'th';
    var digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("d'$suffix' MMMM yyyy").format(this);
  }

    String get displayDateV2 {
    String suffix = 'th';
    var digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ['st', 'nd', 'rd'][digit - 1];
    }
    return DateFormat("d'$suffix' MMM y").format(this);
  }

  String get displayTime {
    return DateFormat('HH:mm').format(this);
  }
}
