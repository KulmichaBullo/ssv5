import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32Medium => TextStyle(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF0D18,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title18Bold => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFF0D18,
      );

  TextStyle get title16Medium => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );

  TextStyle get title16Regular => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF0D18,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14Regular => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF0D18,
      );

  TextStyle get body14 => TextStyle(
        fontSize: 14.fSize,
      );

  TextStyle get body14Medium => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
      );

  TextStyle get body12Bold => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
      );

  TextStyle get body12Regular => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF0D18,
      );
}
