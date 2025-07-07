import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class ChartBarWidget extends StatelessWidget {
  final double height;
  final bool isActive;

  const ChartBarWidget({
    Key? key,
    required this.height,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 37.h,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF427662) : appTheme.color33AFAF,
        borderRadius: BorderRadius.circular(isActive ? 8.h : 7.h),
      ),
    );
  }
}
