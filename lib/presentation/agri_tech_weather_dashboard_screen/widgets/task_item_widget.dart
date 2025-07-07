import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/task_item_model.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskItemModel taskItem;
  final VoidCallback? onTapTask;

  const TaskItemWidget({
    Key? key,
    required this.taskItem,
    this.onTapTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTapTask,
          child: Container(
            padding: EdgeInsets.all(4.h),
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: (taskItem.isCompleted ?? false)
                  ? Color(0xFF427662)
                  : appTheme.colorFFD9E4,
              borderRadius: BorderRadius.circular(4.h),
            ),
            child: CustomImageView(
              imagePath: taskItem.iconUrl ?? '',
              height: 24.h,
              width: 24.h,
            ),
          ),
        ),
        SizedBox(width: 12.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskItem.title ?? '',
                style: TextStyleHelper.instance.title16Medium
                    .copyWith(color: appTheme.colorFF0D18),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgNavigationMapsPinLocation,
                    height: 16.h,
                    width: 16.h,
                  ),
                  SizedBox(width: 4.h),
                  Text(
                    taskItem.location ?? '',
                    style: TextStyleHelper.instance.body14Regular,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 12.h),
        Container(
          margin: EdgeInsets.only(top: 4.h),
          child: Text(
            taskItem.time ?? '',
            style: TextStyleHelper.instance.body14Regular,
          ),
        ),
      ],
    );
  }
}
