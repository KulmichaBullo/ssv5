import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/field_item_model.dart';

class FieldItemWidget extends StatelessWidget {
  final FieldItemModel fieldItem;
  final VoidCallback? onTapField;

  const FieldItemWidget({
    Key? key,
    required this.fieldItem,
    this.onTapField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapField,
      child: Container(
        width: fieldItem.name == 'Rice' ? 173.h : 160.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: fieldItem.name == 'Rice' ? 173.h : 160.h,
              height: 120.h,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CustomImageView(
                    imagePath: fieldItem.imageUrl ?? '',
                    height: 120.h,
                    width: fieldItem.name == 'Rice' ? 173.h : 160.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8.h,
                    left: 8.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.colorFFFFFF,
                        borderRadius: BorderRadius.circular(4.h),
                      ),
                      child: Text(
                        fieldItem.status ?? '',
                        style: TextStyleHelper.instance.body12Bold.copyWith(
                            color: fieldItem.statusColor ?? Color(0xFF0D1814)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8.h,
                    left: 8.h,
                    child: CustomImageView(
                      imagePath: fieldItem.statusIconUrl ?? '',
                      height: fieldItem.name == 'Tomatoes' ? 61.h : 65.h,
                      width: fieldItem.name == 'Tomatoes' ? 71.h : 81.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              width: fieldItem.name == 'Rice' ? 173.h : 160.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (fieldItem.hasBottomStatus ?? false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fieldItem.name ?? '',
                          style: TextStyleHelper.instance.title16Medium
                              .copyWith(color: appTheme.colorFF0D18),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.h,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: appTheme.colorFFD9E4,
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                          child: Text(
                            fieldItem.status ?? '',
                            style: TextStyleHelper.instance.body12Bold
                                .copyWith(color: appTheme.colorFF4276),
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      fieldItem.name ?? '',
                      style: TextStyleHelper.instance.title16Medium
                          .copyWith(color: appTheme.colorFF0D18),
                    ),
                  SizedBox(height: 4.h),
                  Text(
                    fieldItem.area ?? '',
                    style: TextStyleHelper.instance.body14Regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
