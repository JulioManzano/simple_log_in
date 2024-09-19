import 'package:flutter/material.dart';
import 'package:simple_sign_in/core/utils/const.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      useMaterial3: true,
    );
  }
}
