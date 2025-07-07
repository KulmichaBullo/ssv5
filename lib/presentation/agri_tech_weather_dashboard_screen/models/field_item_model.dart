import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

/// This class is used in the [field_item_widget] widget.

class FieldItemModel extends Equatable {
  FieldItemModel({
    this.id,
    this.name,
    this.area,
    this.status,
    this.statusColor,
    this.imageUrl,
    this.statusIconUrl,
    this.isGoodStatus,
    this.hasBottomStatus,
  }) {
    id = id ?? '';
    name = name ?? '';
    area = area ?? '';
    status = status ?? '';
    statusColor = statusColor ?? Color(0xFF0D1814);
    imageUrl = imageUrl ?? '';
    statusIconUrl = statusIconUrl ?? '';
    isGoodStatus = isGoodStatus ?? false;
    hasBottomStatus = hasBottomStatus ?? false;
  }

  String? id;
  String? name;
  String? area;
  String? status;
  Color? statusColor;
  String? imageUrl;
  String? statusIconUrl;
  bool? isGoodStatus;
  bool? hasBottomStatus;

  FieldItemModel copyWith({
    String? id,
    String? name,
    String? area,
    String? status,
    Color? statusColor,
    String? imageUrl,
    String? statusIconUrl,
    bool? isGoodStatus,
    bool? hasBottomStatus,
  }) {
    return FieldItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      status: status ?? this.status,
      statusColor: statusColor ?? this.statusColor,
      imageUrl: imageUrl ?? this.imageUrl,
      statusIconUrl: statusIconUrl ?? this.statusIconUrl,
      isGoodStatus: isGoodStatus ?? this.isGoodStatus,
      hasBottomStatus: hasBottomStatus ?? this.hasBottomStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        area,
        status,
        statusColor,
        imageUrl,
        statusIconUrl,
        isGoodStatus,
        hasBottomStatus,
      ];
}
