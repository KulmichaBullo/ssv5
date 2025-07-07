import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import 'models/field_item_model.dart';
import 'models/task_item_model.dart';
import 'notifier/agritech_weather_dashboard_notifier.dart';
import 'widgets/field_item_widget.dart';
import 'widgets/task_item_widget.dart';
import 'widgets/weather_stat_widget.dart';

class AgriTechWeatherDashboardScreen extends ConsumerStatefulWidget {
  const AgriTechWeatherDashboardScreen({Key? key}) : super(key: key);

  @override
  AgriTechWeatherDashboardScreenState createState() =>
      AgriTechWeatherDashboardScreenState();
}

class AgriTechWeatherDashboardScreenState
    extends ConsumerState<AgriTechWeatherDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.colorFFFFFF,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildWeatherSection(),
                      _buildAIRecommendationBanner(),
                      _buildMyFieldsSection(),
                      _buildTasksSection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      locationText: 'Singaraja, Bali',
      notificationIconPath: ImageConstant.imgMusicAudioBellNotifications,
      showLocation: true,
      showNotification: true,
      backgroundColor: appTheme.colorFFFFFF,
      elevation: 4.0,
      onLocationTap: () {
        onTapLocation();
      },
      onNotificationTap: () {
        onTapNotification();
      },
    );
  }

  /// Section Widget
  Widget _buildWeatherSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 16.h,
        top: 16.h,
        right: 16.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0x00F1F3F2),
            appTheme.colorFFF2F3,
          ],
        ),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16.h),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 40.h),
                padding: EdgeInsets.all(24.h),
                child: Column(
                  children: [
                    Text(
                      '24°',
                      style: TextStyleHelper.instance.headline32Medium,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Today is partly sunny day!',
                      style: TextStyleHelper.instance.body14Regular,
                    ),
                    SizedBox(height: 24.h),
                    _buildWeatherStats(),
                  ],
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgGroup1,
                height: 78.h,
                width: 81.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildWeatherStats() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(agriTechWeatherDashboardNotifier);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              state.weatherStats?.length ?? 0,
              (index) {
                final weatherStat = state.weatherStats![index];
                return WeatherStatWidget(
                  weatherStat: weatherStat,
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAIRecommendationBanner() {
    return GestureDetector(
      onTap: () {
        onTapAIRecommendation();
      },
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(
          left: 16.h,
          top: 16.h,
          right: 16.h,
        ),
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFC0D1CB),
              appTheme.colorFF4276,
            ],
          ),
          borderRadius: BorderRadius.circular(12.h),
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgFrame19,
              height: 40.h,
              width: 40.h,
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: Text(
                'Check our AI recommendation for your fields!',
                style: TextStyleHelper.instance.title16Medium
                    .copyWith(color: appTheme.colorFFFFFF),
              ),
            ),
            SizedBox(width: 8.h),
            CustomImageView(
              imagePath: ImageConstant.imgArrowsDiagramsArrow,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMyFieldsSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 16.h,
        top: 24.h,
        right: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Fields',
                style: TextStyleHelper.instance.title18Bold,
              ),
              CustomButton(
                onPressed: () {
                  onTapSeeAllFields();
                },
                text: 'See All',
                variant: CustomButtonVariant.text,
                textColor: appTheme.colorFF4276,
                fontSize: 16.fSize,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildFieldsList(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFieldsList() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(agriTechWeatherDashboardNotifier);
        return SizedBox(
          height: 200.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return SizedBox(width: 12.h);
            },
            itemCount: state.fieldItems?.length ?? 0,
            itemBuilder: (context, index) {
              final fieldItem = state.fieldItems![index];
              return FieldItemWidget(
                fieldItem: fieldItem,
                onTapField: () {
                  onTapField(fieldItem);
                },
              );
            },
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildTasksSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 16.h,
        top: 24.h,
        right: 16.h,
        bottom: 16.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tasks To Do',
                style: TextStyleHelper.instance.title18Bold,
              ),
              CustomButton(
                onPressed: () {
                  onTapSeeAllTasks();
                },
                text: 'See All',
                variant: CustomButtonVariant.text,
                textColor: appTheme.colorFF4276,
                fontSize: 16.fSize,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildTasksList(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTasksList() {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(agriTechWeatherDashboardNotifier);
        return ListView.separated(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemCount: state.taskItems?.length ?? 0,
          itemBuilder: (context, index) {
            final taskItem = state.taskItems![index];
            return TaskItemWidget(
              taskItem: taskItem,
              onTapTask: () {
                onTapTaskToggle(taskItem);
              },
            );
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildBottomNavigation() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.colorFFF2F3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(
            icon: ImageConstant.imgSmartHomeSmartHomeHouse,
            label: 'Home',
            isActive: true,
            onTap: () {
              onTapHomeNavigation();
            },
          ),
          _buildNavItem(
            icon: ImageConstant.imgFilesFileblankchecklist,
            label: 'Tasks',
            isActive: false,
            onTap: () {
              onTapTasksNavigation();
            },
          ),
          GestureDetector(
            onTap: () {
              onTapCenterAction();
            },
            child: Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgFrame1948x48,
                height: 48.h,
                width: 48.h,
              ),
            ),
          ),
          _buildNavItem(
            icon: ImageConstant.imgFruitsVegetablesArtichoke,
            label: 'Fields',
            isActive: false,
            onTap: () {
              onTapFieldsNavigation();
            },
          ),
          _buildNavItem(
            icon: ImageConstant.imgUserSingleuser,
            label: 'Profile',
            isActive: false,
            onTap: () {
              onTapProfileNavigation();
            },
          ),
        ],
      ),
    );
  }

  /// Common Widget
  Widget _buildNavItem({
    required String icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: icon,
            height: 24.h,
            width: 24.h,
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyleHelper.instance.body14.copyWith(
                color: isActive ? Color(0xFF427662) : appTheme.colorFF0D18),
          ),
        ],
      ),
    );
  }

  /// Handles location tap
  void onTapLocation() {
    // Handle location tap
  }

  /// Handles notification tap
  void onTapNotification() {
    // Handle notification tap
  }

  /// Handles AI recommendation tap
  void onTapAIRecommendation() {
    // Handle AI recommendation tap
  }

  /// Handles see all fields tap
  void onTapSeeAllFields() {
    // Handle see all fields tap
  }

  /// Handles field tap
  void onTapField(FieldItemModel fieldItem) {
    // Handle field tap
  }

  /// Handles see all tasks tap
  void onTapSeeAllTasks() {
    // Handle see all tasks tap
  }

  /// Handles task toggle
  void onTapTaskToggle(TaskItemModel taskItem) {
    ref.read(agriTechWeatherDashboardNotifier.notifier).toggleTask(taskItem);
  }

  /// Handles home navigation tap
  void onTapHomeNavigation() {
    // Handle home navigation tap
  }

  /// Handles tasks navigation tap
  void onTapTasksNavigation() {
    // Handle tasks navigation tap
  }

  /// Handles center action tap
  void onTapCenterAction() {
    // Handle center action tap
  }

  /// Handles fields navigation tap
  void onTapFieldsNavigation() {
    // Handle fields navigation tap
  }

  /// Handles profile navigation tap
  void onTapProfileNavigation() {
    // Handle profile navigation tap
  }
}
