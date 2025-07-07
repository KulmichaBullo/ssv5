import 'package:flutter/material.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../core/app_export.dart';
import '../models/weather_model.dart';

class WeatherCardWidget extends StatelessWidget {
  final WeatherModel? model;

  const WeatherCardWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      width: 101.h,
      decoration: BoxDecoration(
        color: appTheme.colorFFFFFF,
        borderRadius: BorderRadius.circular(8.h),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: model?.icon ?? ImageConstant.imgGroup46,
            height: 32.h,
            width: 33.h,
          ),
          SizedBox(height: 8.h),
          Text(
            model?.temperature ?? '',
            style: TextStyleHelper.instance.title16Medium
                .copyWith(color: appTheme.colorFF0D18, height: 1.31),
          ),
          SizedBox(height: 4.h),
          Text(
            model?.period ?? '',
            style:
                TextStyleHelper.instance.body14Regular.copyWith(height: 1.36),
          ),
        ],
      ),
    );
  }
}
