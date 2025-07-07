import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/weather_stat_model.dart';

class WeatherStatWidget extends StatelessWidget {
  final WeatherStatModel weatherStat;

  const WeatherStatWidget({
    Key? key,
    required this.weatherStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: appTheme.colorFFFFFF,
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: Column(
          children: [
            Text(
              weatherStat.value ?? '',
              style: TextStyleHelper.instance.title16Medium
                  .copyWith(color: appTheme.colorFF0D18),
            ),
            SizedBox(height: 4.h),
            Text(
              weatherStat.label ?? '',
              style: TextStyleHelper.instance.body14Regular,
            ),
          ],
        ),
      ),
    );
  }
}
