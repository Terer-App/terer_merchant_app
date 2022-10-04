import 'dart:io';

import '../../../infrastructure/platform/platform_enum.dart';

SupportedPlatform getPlatform() {
  if (Platform.isIOS) {
    return SupportedPlatform.ios;
  } else if (Platform.isAndroid) {
    return SupportedPlatform.android;
  } else {
    return SupportedPlatform.other;
  }
}
