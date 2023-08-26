import '../services/navigation_service/routers/routing_dto.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  RoutingDto get getRoutingData {
    final uriData = Uri.parse(this);
    return RoutingDto(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }

  String get capitalizeCamel {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1)}';
    } else {
      return this;
    }
  }

  static String formatDate(DateTime date) {
    DateFormat outputFormat = DateFormat('d MMM yyyy');
    return outputFormat.format(date);
  }

  static String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
