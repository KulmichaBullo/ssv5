import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../models/info_card_model.dart';

class InfoCardWidget extends StatelessWidget {
  final InfoCardModel? model;
  final VoidCallback? onTap;

  const InfoCardWidget({
    Key? key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      width: 175.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: appTheme.colorFFE4E7,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(10.h),
        gradient: (model?.hasGradient ?? false)
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF427662),
                  appTheme.colorFF4276,
                ],
              )
            : null,
      ),
      padding: EdgeInsets.all(12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model?.title ?? '',
            style:
                TextStyleHelper.instance.body14Regular.copyWith(height: 1.36),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model?.value ?? '',
                      style: TextStyleHelper.instance.title16Medium.copyWith(
                          color: model?.valueColor ?? Color(0xFF0D1814),
                          height: 1.31),
                    ),
                    if (model?.subtitle != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        model?.subtitle ?? '',
                        style: TextStyleHelper.instance.body14Medium.copyWith(
                            color: model?.subtitleColor ?? Color(0xFF0D1814),
                            height: 1.36),
                      ),
                    ],
                  ],
                ),
              ),
              if (model?.hasArrow ?? false)
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
        ],
      ),
    );
  }
}
