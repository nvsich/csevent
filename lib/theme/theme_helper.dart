import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:csevent/core/utils/size_utils.dart';

String _appTheme = "primary";

class ThemeHelper {
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme "
          "class in in JSON. Try Running flutter pub run build_runner");
    }

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found. Make sure you have added this theme "
          "class in in JSON. Try Running flutter pub run build_runner");
    }

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.onPrimary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.h),
          ),
          shadowColor: appTheme.black900.withOpacity(0.15),
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return colorScheme.primary;
            }
            return colorScheme.onSurface;
          },
        ),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
    );
  }

  PrimaryColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.4),
          fontSize: 14.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900.withOpacity(0.4),
          fontSize: 28.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w200,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    primary: Color(0XFFBF818C),
    onPrimary: Color(0XFFFFFFFF),
  );
}

class PrimaryColors {
  Color get black900 => const Color(0XFF000000);

  Color get blue50 => const Color(0XFFD5E1FF);

  Color get cyan50 => const Color(0XFFD5FFFF);

  Color get gray200 => const Color(0XFFEBEBEB);

  Color get lightBlue50 => const Color(0XFFD5F2FF);

  Color get orange50 => const Color(0XFFFFEED6);

  Color get orange5001 => const Color(0XFFFFEED5);

  Color get purple50 => const Color(0XFFF1D5FF);

  Color get red100 => const Color(0XFFFFD8D5);

  Color get red10001 => const Color(0XFFFFD8D6);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
