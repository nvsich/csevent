import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillPrimaryTL23 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
      );

  static ButtonStyle get outlineBlackTL23 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.red10001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.15),
        elevation: 4,
      );

  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
