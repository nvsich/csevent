import 'package:flutter/material.dart';
import 'package:csevent/theme/theme_helper.dart';

class CustomTextStyles {
  static get bodyLargeLight => theme.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );

  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );

  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900.withOpacity(0.4),
      );

  static get bodySmallLight => theme.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w300,
      );

  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );

  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.4),
        fontWeight: FontWeight.w400,
      );

  static get titleLargeLight => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w300,
      );

  static get titleLargeRegular => theme.textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.w400,
      );

  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }
}
