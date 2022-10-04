import 'package:sizer/sizer.dart';

extension SizerUtilExtension on SizerUtil {
  static bool get checkSizerIsSupported {
    return !(SizerUtil.deviceType == DeviceType.web && SizerUtil.width > 800);
  }
}
