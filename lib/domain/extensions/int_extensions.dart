import 'dart:math';

extension IntExtension on int {
  String get generateRandomString {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        this, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}
