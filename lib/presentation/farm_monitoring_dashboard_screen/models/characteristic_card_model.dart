import '../../../core/app_export.dart';
import 'package:flutter/material.dart';

class CharacteristicCardModel extends Equatable {
  CharacteristicCardModel({
    this.icon,
    this.title,
    this.status,
    this.statusColor,
  }) {
    icon = icon ?? '';
    title = title ?? '';
    status = status ?? '';
    statusColor = statusColor ?? Color(0xFF0D1814);
  }

  String? icon;
  String? title;
  String? status;
  Color? statusColor;

  CharacteristicCardModel copyWith({
    String? icon,
    String? title,
    String? status,
    Color? statusColor,
  }) {
    return CharacteristicCardModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      status: status ?? this.status,
      statusColor: statusColor ?? this.statusColor,
    );
  }

  @override
  List<Object?> get props => [
        icon,
        title,
        status,
        statusColor,
      ];
}
