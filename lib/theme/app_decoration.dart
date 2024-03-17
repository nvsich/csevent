import 'package:flutter/material.dart';
import 'package:csevent/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue50,
      );

  static BoxDecoration get fillCyan => BoxDecoration(
        color: appTheme.cyan50,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray200,
      );

  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue50,
      );

  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  static BoxDecoration get fillOrange => BoxDecoration(
        color: appTheme.orange5001,
      );

  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple50,
      );

  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red100,
      );

  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.orange50,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineBlack900 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.black900.withOpacity(0.4),
            width: 1.h,
          ),
        ),
      );

  static BoxDecoration get shadow => BoxDecoration(
        color: appTheme.red10001,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.15),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
}
