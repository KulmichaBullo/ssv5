import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

class InfoCardModel extends Equatable {
  InfoCardModel({
    this.title,
    this.value,
    this.subtitle,
    this.hasGradient,
    this.hasArrow,
    this.valueColor,
    this.subtitleColor,
  }) {
    title = title ?? '';
    value = value ?? '';
    subtitle = subtitle ?? '';
    hasGradient = hasGradient ?? false;
    hasArrow = hasArrow ?? false;
    valueColor = valueColor ?? Color(0xFF0D1814);
    subtitleColor = subtitleColor ?? Color(0xFF0D1814);
  }

  String? title;
  String? value;
  String? subtitle;
  bool? hasGradient;
  bool? hasArrow;
  Color? valueColor;
  Color? subtitleColor;

  InfoCardModel copyWith({
    String? title,
    String? value,
    String? subtitle,
    bool? hasGradient,
    bool? hasArrow,
    Color? valueColor,
    Color? subtitleColor,
  }) {
    return InfoCardModel(
      title: title ?? this.title,
      value: value ?? this.value,
      subtitle: subtitle ?? this.subtitle,
      hasGradient: hasGradient ?? this.hasGradient,
      hasArrow: hasArrow ?? this.hasArrow,
      valueColor: valueColor ?? this.valueColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
    );
  }

  @override
  List<Object?> get props => [
        title,
        value,
        subtitle,
        hasGradient,
        hasArrow,
        valueColor,
        subtitleColor,
      ];
}
