import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_button.dart';
import 'notifier/farm_monitoring_dashboard_notifier.dart';
import 'widgets/info_card_widget.dart';
import 'widgets/weather_card_widget.dart';
import 'widgets/characteristic_card_widget.dart';
import 'widgets/chart_bar_widget.dart';

class FarmMonitoringDashboardScreen extends ConsumerStatefulWidget {
  const FarmMonitoringDashboardScreen({Key? key}) : super(key: key);

  @override
  FarmMonitoringDashboardScreenState createState() =>
      FarmMonitoringDashboardScreenState();
}

class FarmMonitoringDashboardScreenState
    extends ConsumerState<FarmMonitoringDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeroSection(context),
                _buildFieldTitleSection(context),
                _buildInfoGrid(context),
                _buildTabNavigation(context),
                _buildWeatherSection(context),
                _buildBasicCharacteristics(context),
                _buildCropGrowthMonitoring(context),
                _buildFarmAISection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 270.h,
      width: 390.h,
      child: Stack(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage7,
            height: 270.h,
            width: 390.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 20.h,
              width: 390.h,
              decoration: BoxDecoration(
                color: appTheme.colorFFFFFF,
                boxShadow: [
                  BoxShadow(
                    color: appTheme.colorFF8888,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 29.h,
            left: 16.h,
            child: CustomButton(
              onPressed: () {
                _onTapBackButton(context);
              },
              leadingIcon: ImageConstant.imgFrame50,
              variant: CustomButtonVariant.icon,
              backgroundColor: appTheme.color00FFFF,
              height: 44.h,
              width: 44.h,
              borderRadius: 0,
            ),
          ),
          Positioned(
            top: 35.h,
            left: 104.h,
            child: CustomImageView(
              imagePath: ImageConstant.imgGroup4,
              height: 143.h,
              width: 167.h,
            ),
          ),
          Positioned(
            bottom: 21.h,
            left: 16.h,
            child: Container(
              width: 358.h,
              height: 44.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appTheme.colorFFF2F3,
                      borderRadius: BorderRadius.circular(4.h),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.h),
                    child: Text(
                      'Generate by Satellite imagery services',
                      style: TextStyleHelper.instance.body12Regular
                          .copyWith(height: 1.33),
                    ),
                  ),
                  CustomButton(
                    onPressed: () {
                      _onTapFullscreenButton(context);
                    },
                    leadingIcon:
                        ImageConstant.imgInterfaceEssentialFullScreenArrow,
                    variant: CustomButtonVariant.icon,
                    backgroundColor: appTheme.colorFFFFFF,
                    height: 44.h,
                    width: 44.h,
                    borderRadius: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldTitleSection(BuildContext context) {
    return Container(
      width: 358.h,
      height: 32.h,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, top: 17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Tomatoes Field',
                style: TextStyleHelper.instance.title16Medium
                    .copyWith(color: appTheme.colorFF0D18, height: 1.31),
              ),
              SizedBox(width: 8.h),
              CustomImageView(
                imagePath: ImageConstant.imgContentEditPenEdit,
                height: 16.h,
                width: 16.h,
              ),
            ],
          ),
          CustomButton(
            onPressed: () {
              _onTapMoreDetailsButton(context);
            },
            text: 'More Details',
            trailingIcon: ImageConstant.imgArrowsDiagramsArrowGray900,
            variant: CustomButtonVariant.elevated,
            backgroundColor: appTheme.colorFFF2F3,
            textColor: appTheme.colorFF0D18,
            height: 32.h,
            width: 114.h,
            borderRadius: 8.h,
            fontSize: 14.fSize,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoGrid(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 12.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InfoCardWidget(
                      model: state.infoCards?[0],
                      onTap: () {
                        _onTapCropHealthCard(context);
                      },
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Expanded(
                    child: InfoCardWidget(
                      model: state.infoCards?[1],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: InfoCardWidget(
                      model: state.infoCards?[2],
                      onTap: () {
                        _onTapExpenseCard(context);
                      },
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Expanded(
                    child: InfoCardWidget(
                      model: state.infoCards?[3],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabNavigation(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          height: 44.h,
          width: 358.h,
          margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 22.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: appTheme.colorFFE5E5,
                width: 1.h,
              ),
            ),
          ),
          child: Row(
            children: [
              _buildTabItem('Task', 0, state.selectedTabIndex ?? 0),
              _buildTabItem('Monitoring', 1, state.selectedTabIndex ?? 0),
              _buildTabItem('Integrations', 2, state.selectedTabIndex ?? 0),
              _buildTabItem('Settings', 3, state.selectedTabIndex ?? 0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabItem(String title, int index, int selectedIndex) {
    bool isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: () {
        ref
            .read(farmMonitoringDashboardNotifierProvider.notifier)
            .switchTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.h),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
                  bottom: BorderSide(
                    color: appTheme.colorFF4276,
                    width: 2.h,
                  ),
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyleHelper.instance.body14Medium.copyWith(
              color: isSelected ? Color(0xFF427662) : appTheme.colorFF0D18,
              height: 1.36),
        ),
      ),
    );
  }

  Widget _buildWeatherSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weather',
                    style: TextStyleHelper.instance.title16Medium
                        .copyWith(color: appTheme.colorFF0D18, height: 1.31),
                  ),
                  CustomButton(
                    onPressed: () {
                      _onTapWeatherDetailsButton(context);
                    },
                    text: 'More Details',
                    trailingIcon: ImageConstant.imgArrowsDiagramsArrowGray900,
                    variant: CustomButtonVariant.elevated,
                    backgroundColor: appTheme.colorFFF2F3,
                    textColor: appTheme.colorFF0D18,
                    height: 32.h,
                    width: 114.h,
                    borderRadius: 8.h,
                    fontSize: 14.fSize,
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Container(
                height: 184.h,
                width: 358.h,
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
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.h),
                      child: Row(
                        children: [
                          WeatherCardWidget(
                            model: state.weatherModel,
                          ),
                          SizedBox(width: 8.h),
                          Expanded(
                            child: Container(
                              height: 112.h,
                              decoration: BoxDecoration(
                                color: appTheme.colorFFFFFF,
                                borderRadius: BorderRadius.circular(10.h),
                              ),
                              padding: EdgeInsets.all(12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tips',
                                    style: TextStyleHelper
                                        .instance.body14Regular
                                        .copyWith(
                                            color: appTheme.colorFF4276,
                                            height: 1.36),
                                  ),
                                  SizedBox(height: 8.h),
                                  Expanded(
                                    child: Text(
                                      'Water your tomato plants deeply and regularly. Aim to keep the soil consistently moist, but not soggy.',
                                      style: TextStyleHelper
                                          .instance.body14Regular
                                          .copyWith(height: 1.43),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      child: CustomButton(
                        onPressed: () {
                          _onTapAddToTaskButton(context);
                        },
                        text: 'Add to task',
                        trailingIcon: ImageConstant.imgArrowright,
                        variant: CustomButtonVariant.elevated,
                        backgroundColor: appTheme.colorFFFFFF,
                        textColor: appTheme.colorFF0D18,
                        height: 48.h,
                        width: 342.h,
                        borderRadius: 10.h,
                        fontSize: 15.fSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBasicCharacteristics(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Characteristic',
                style: TextStyleHelper.instance.title16Medium
                    .copyWith(color: appTheme.colorFF0D18, height: 1.31),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: CharacteristicCardWidget(
                      model: state.characteristicCards?[0],
                      onTap: () {
                        _onTapNutrientCard(context);
                      },
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Expanded(
                    child: CharacteristicCardWidget(
                      model: state.characteristicCards?[1],
                      onTap: () {
                        _onTapSoilCard(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              _buildWaterSection(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWaterSection(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: appTheme.colorFFE4E7,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(10.h),
          ),
          padding: EdgeInsets.all(12.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            imagePath:
                                ImageConstant.imgFrame1171276450Gray90001,
                            height: 24.h,
                            width: 24.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.h),
                      Text(
                        'Water',
                        style: TextStyleHelper.instance.title16Regular
                            .copyWith(height: 1.31),
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {
                      _onTapWaterDetailsButton(context);
                    },
                    leadingIcon: ImageConstant.imgArrowsDiagramsArrowGray900,
                    variant: CustomButtonVariant.icon,
                    backgroundColor: appTheme.colorFFF2F3,
                    height: 24.h,
                    width: 24.h,
                    borderRadius: 8.h,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.maxFinite,
                child: Text(
                  'Normal Level',
                  style: TextStyleHelper.instance.title16Medium
                      .copyWith(color: appTheme.colorFF4276, height: 1.31),
                ),
              ),
              SizedBox(height: 16.h),
              _buildWaterChart(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWaterChart(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          height: 166.h,
          width: 334.h,
          child: Column(
            children: [
              Container(
                height: 130.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '15h',
                            style: TextStyleHelper.instance.body14Regular
                                .copyWith(
                                    color: appTheme.colorFF8787, height: 1.36),
                          ),
                          Text(
                            '10h',
                            style: TextStyleHelper.instance.body14Regular
                                .copyWith(
                                    color: appTheme.colorFF8787, height: 1.36),
                          ),
                          Text(
                            '5h',
                            style: TextStyleHelper.instance.body14Regular
                                .copyWith(
                                    color: appTheme.colorFF8787, height: 1.36),
                          ),
                          Text(
                            '0',
                            style: TextStyleHelper.instance.body14Regular
                                .copyWith(
                                    color: appTheme.colorFF8787, height: 1.36),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ChartBarWidget(
                            height: 14.h,
                            isActive: false,
                          ),
                          ChartBarWidget(
                            height: 70.h,
                            isActive: false,
                          ),
                          ChartBarWidget(
                            height: 38.h,
                            isActive: false,
                          ),
                          ChartBarWidget(
                            height: 97.h,
                            isActive: false,
                          ),
                          ChartBarWidget(
                            height: 89.h,
                            isActive: true,
                          ),
                          ChartBarWidget(
                            height: 76.h,
                            isActive: false,
                          ),
                          ChartBarWidget(
                            height: 51.h,
                            isActive: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.only(top: 8.h),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: appTheme.colorFFE4E7,
                      width: 1.h,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Days',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '1',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '2',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '3',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '4',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '5',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '6',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                    Text(
                      '7',
                      style: TextStyleHelper.instance.body14Regular
                          .copyWith(height: 1.36),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCropGrowthMonitoring(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(farmMonitoringDashboardNotifierProvider);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16.h).copyWith(top: 16.h),
          decoration: BoxDecoration(
            color: appTheme.colorFFFFFF,
            border: Border.all(
              color: appTheme.colorFFE4E7,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(16.h),
          ),
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            imagePath: ImageConstant.imgFrame1171276450Gray900,
                            height: 24.h,
                            width: 24.h,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.h),
                      Text(
                        'Crop Growth Monitoring',
                        style: TextStyleHelper.instance.title16Regular
                            .copyWith(height: 1.31),
                      ),
                    ],
                  ),
                  Container(
                    height: 36.h,
                    width: 76.h,
                    decoration: BoxDecoration(
                      color: appTheme.colorFFF2F3,
                      borderRadius: BorderRadius.circular(8.h),
                    ),
                    child: DropdownButton<String>(
                      value: state.selectedPeriod ?? 'Days',
                      onChanged: (String? newValue) {
                        ref
                            .read(farmMonitoringDashboardNotifierProvider
                                .notifier)
                            .changePeriod(newValue ?? 'Days');
                      },
                      underline: Container(),
                      items: ['Days', 'Weeks', 'Months']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyleHelper.instance.title16Regular
                                .copyWith(height: 1.31),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: appTheme.colorFFE4E7,
                      width: 1.h,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(farmMonitoringDashboardNotifierProvider
                                .notifier)
                            .switchChart('height');
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.h, right: 16.h),
                        decoration: BoxDecoration(
                          border: (state.selectedChart ?? 'height') == 'height'
                              ? Border(
                                  bottom: BorderSide(
                                    color: appTheme.colorFF4276,
                                    width: 2.h,
                                  ),
                                )
                              : null,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Cumulative Height ',
                                style: TextStyleHelper.instance.title16Regular
                                    .copyWith(height: 1.31),
                              ),
                              TextSpan(
                                text: '(cm)',
                                style: TextStyleHelper.instance.title16Regular
                                    .copyWith(height: 1.31),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(farmMonitoringDashboardNotifierProvider
                                .notifier)
                            .switchChart('biomass');
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.h, left: 16.h),
                        decoration: BoxDecoration(
                          border: (state.selectedChart ?? 'height') == 'biomass'
                              ? Border(
                                  bottom: BorderSide(
                                    color: appTheme.colorFF4276,
                                    width: 2.h,
                                  ),
                                )
                              : null,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Cumulative Biomass ',
                                style: TextStyleHelper.instance.title16Regular
                                    .copyWith(height: 1.31),
                              ),
                              TextSpan(
                                text: '(kg/ha)',
                                style: TextStyleHelper.instance.title16Regular
                                    .copyWith(height: 1.31),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              _buildGrowthChart(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGrowthChart(BuildContext context) {
    return Container(
      height: 277.h,
      width: 342.h,
      child: Stack(
        children: [
          // Grid lines
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1.h,
                  color: appTheme.colorFFC3C6,
                ),
                Container(
                  height: 1.h,
                  color: appTheme.colorFFC3C6,
                ),
                Container(
                  height: 1.h,
                  color: appTheme.colorFFC3C6,
                ),
                Container(
                  height: 1.h,
                  color: appTheme.colorFFC3C6,
                ),
              ],
            ),
          ),
          // Chart line
          Positioned(
            bottom: 33.h,
            left: 32.h,
            child: Container(
              width: 287.h,
              height: 1.h,
              color: appTheme.colorFF0D18,
            ),
          ),
          // Data point tooltip
          Positioned(
            top: 34.h,
            left: 108.h,
            child: Container(
              decoration: BoxDecoration(
                color: appTheme.colorFFFFFF,
                borderRadius: BorderRadius.circular(8.h),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.colorFF0D18,
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8.h,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: appTheme.colorFFD9E4,
                      borderRadius: BorderRadius.circular(2.h),
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Text(
                    'Tomatoes Field',
                    style: TextStyleHelper.instance.body12Regular
                        .copyWith(height: 1.33),
                  ),
                  SizedBox(width: 8.h),
                  Text(
                    '3.2 cm',
                    style: TextStyleHelper.instance.body12Regular
                        .copyWith(height: 1.33),
                  ),
                ],
              ),
            ),
          ),
          // Chart area with background
          Positioned(
            bottom: 33.h,
            left: 53.h,
            child: Container(
              height: 180.h,
              width: 289.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgVector923),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 59.h,
                    left: 166.h,
                    child: Container(
                      width: 6.h,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: appTheme.colorFFD9E4,
                        border: Border.all(
                          color: appTheme.colorFFFFFF,
                          width: 1.h,
                        ),
                        borderRadius: BorderRadius.circular(3.h),
                        boxShadow: [
                          BoxShadow(
                            color: appTheme.colorFF0D18,
                            blurRadius: 4,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Y-axis labels
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              height: 253.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9',
                    style: TextStyleHelper.instance.body14Regular
                        .copyWith(height: 1.36),
                  ),
                  Text(
                    '6',
                    style: TextStyleHelper.instance.body14Regular
                        .copyWith(height: 1.36),
                  ),
                  Text(
                    '3',
                    style: TextStyleHelper.instance.body14Regular
                        .copyWith(height: 1.36),
                  ),
                  Text(
                    '2',
                    style: TextStyleHelper.instance.body14Regular
                        .copyWith(height: 1.36),
                  ),
                  Text(
                    '1',
                    style: TextStyleHelper.instance.body14Regular
                        .copyWith(height: 1.36),
                  ),
                ],
              ),
            ),
          ),
          // X-axis labels
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 342.h,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: appTheme.colorFFE4E7,
                    width: 1.h,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 8.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Days',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '1',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '2',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '3',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '4',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '5',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '6',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '7',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '8',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                        Text(
                          '9',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.36),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.only(right: 32.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '10',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '11',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '12',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '13',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '14',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '15',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '16',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '17',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '18',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '19',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                        SizedBox(width: 32.h),
                        Text(
                          '20',
                          style: TextStyleHelper.instance.body14Regular
                              .copyWith(height: 1.43),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Unit label
          Positioned(
            bottom: 12.h,
            left: 5.h,
            child: Text(
              'cm',
              style:
                  TextStyleHelper.instance.body14Regular.copyWith(height: 1.36),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFarmAISection(BuildContext context) {
    return Container(
      height: 92.h,
      width: 390.h,
      color: appTheme.colorFFF2F3,
      child: Center(
        child: CustomButton(
          onPressed: () {
            _onTapAskFarmAIButton(context);
          },
          text: 'Ask Fairm AI',
          variant: CustomButtonVariant.elevated,
          backgroundColor: appTheme.colorFFFFFF,
          textColor: appTheme.colorFF0D18,
          height: 48.h,
          width: 358.h,
          borderRadius: 10.h,
          fontSize: 15.fSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  void _onTapBackButton(BuildContext context) {
    NavigatorService.goBack();
  }

  void _onTapFullscreenButton(BuildContext context) {
    // Handle fullscreen toggle
  }

  void _onTapMoreDetailsButton(BuildContext context) {
    // Handle more details
  }

  void _onTapCropHealthCard(BuildContext context) {
    // Handle crop health details
  }

  void _onTapExpenseCard(BuildContext context) {
    // Handle expense details
  }

  void _onTapWeatherDetailsButton(BuildContext context) {
    // Handle weather details
  }

  void _onTapAddToTaskButton(BuildContext context) {
    // Handle add to task
  }

  void _onTapNutrientCard(BuildContext context) {
    // Handle nutrient details
  }

  void _onTapSoilCard(BuildContext context) {
    // Handle soil details
  }

  void _onTapWaterDetailsButton(BuildContext context) {
    // Handle water details
  }

  void _onTapAskFarmAIButton(BuildContext context) {
    // Handle ask farm AI
  }
}
