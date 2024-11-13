import 'package:flutter/material.dart';
import 'dart:math';

class GenericHelper {
    static String formatSku({String? sku, required String redemptionDuration}) {
    try {
      if (sku == null) {
        return redemptionDuration;
      }
      final parts = sku.split('-');
      if (parts.length < 3) {
        return redemptionDuration;
      }
      final durationValue = parts[2];
      final durationType = parts[1];

      final formattedType = durationValue == '1'
          ? durationType.substring(0, durationType.length - 1)
          : durationType;

      return '$durationValue $formattedType';
    } catch (e) {
      return redemptionDuration;
    }
  }
}
