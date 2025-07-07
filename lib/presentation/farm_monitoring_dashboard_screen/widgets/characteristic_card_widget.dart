import 'package:flutter/material.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../models/characteristic_card_model.dart';

class CharacteristicCardWidget extends StatelessWidget {
  final CharacteristicCardModel? model;
  final VoidCallback? onTap;

  const CharacteristicCardWidget({
    Key? key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 175.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: appTheme.colorFFE4E7,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(10.h),
      ),
      padding: EdgeInsets.all(12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 32.h,
                      width: 32.h,
                      decoration: BoxDecoration(
                        color: appTheme.colorFFFFFF,
                        border: Border.all(
                          color: appTheme.colorFFE4E7,
                          width: 1.h,
                        ),
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      child: Center(
                        child: CustomImageView(
                          imagePath: model?.icon ?? '',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: Text(
                        model?.title ?? '',
                        style: TextStyleHelper.instance.title16Regular
                            .copyWith(height: 1.31),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  model?.status ?? '',
                  style: TextStyleHelper.instance.title16Medium.copyWith(
                      color: model?.statusColor ?? Color(0xFF0D1814),
                      height: 1.31),
                ),
              ],
            ),
          ),
          CustomButton(
            onPressed: onTap,
            leadingIcon: ImageConstant.imgArrowsDiagramsArrowGray900,
            variant: CustomButtonVariant.icon,
            backgroundColor: appTheme.colorFFF2F3,
            height: 24.h,
            width: 24.h,
            borderRadius: 8.h,
          ),
        ],
      ),
    );
  }
}
