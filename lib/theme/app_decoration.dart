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

  static BoxDecoration getShadowDecorationByColor(String color) {
    return BoxDecoration(
      color: getColorByString(color),
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

  static Color getColorByString(String color) {
    final colorMap = {
      "fillPurple": appTheme.purple50,
      "fillRed": appTheme.red100,
      "fillOrange": appTheme.orange5001,
      "fillCyan": appTheme.cyan50,
      "fillLightBlue": appTheme.lightBlue50,
      "fillBlue": appTheme.blue50,
      "fillGray": appTheme.gray200,
    };

    return colorMap[color] ?? appTheme.red10001;
  }

  static BoxDecoration getDecorationByColor(String color) {
    switch (color) {
      case "fillBlue":
        return fillBlue;

      case "fillCyan":
        return fillCyan;

      case "fillGray":
        return fillGray;

      case "fillLightBlue":
        return fillLightBlue;

      case "fillOnPrimary":
        return fillOnPrimary;

      case "fillOrange":
        return fillOrange;

      case "fillPurple":
        return fillPurple;

      case "fillRed":
        return fillRed;

      case "outlineBlack":
        return outlineBlack;

      case "outlineBlack900":
        return outlineBlack900;

      default:
        return fillBlue;
    }
  }
}

class BorderRadiusStyle {
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );

  static BorderRadius get roundedBorder3 => BorderRadius.circular(
        3.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
