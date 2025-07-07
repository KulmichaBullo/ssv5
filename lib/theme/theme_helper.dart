import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../core/utils/pref_utils.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get black => Color(0xFF1E1E1E);
  Color get white => Color(0xFFFFFFFF);
  Color get gray300 => Color(0xFFD1D5DB);

  // Additional Colors
  Color get whiteCustom => Colors.white;
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get colorFFFFFF => Color(0xFFFFFFFF);
  Color get color00F1F3 => Color(0x00F1F3F2);
  Color get colorFFF2F3 => Color(0xFFF2F3F2);
  Color get colorFF0D18 => Color(0xFF0D1814);
  Color get colorFFC0D1 => Color(0xFFC0D1CB);
  Color get colorFF4276 => Color(0xFF427662);
  Color get colorFFD9E4 => Color(0xFFD9E4E0);
  Color get colorFF8888 => Color(0xFF888888);
  Color get color00FFFF => Color(0x00FFFFFF);
  Color get colorFFE5E5 => Color(0xFFE5E5E5);
  Color get colorFFE4E7 => Color(0xFFE4E7E6);
  Color get colorFF8787 => Color(0xFF878787);
  Color get colorFFC3C6 => Color(0xFFC3C6C5);
  Color get color33AFAF => Color(0x33AFAFAF);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
