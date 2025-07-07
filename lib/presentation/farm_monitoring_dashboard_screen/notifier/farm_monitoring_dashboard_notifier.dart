import '../models/farm_monitoring_dashboard_model.dart';
import '../models/info_card_model.dart';
import '../models/weather_model.dart';
import '../models/characteristic_card_model.dart';
import '../../../core/app_export.dart';

part 'farm_monitoring_dashboard_state.dart';

final farmMonitoringDashboardNotifierProvider = StateNotifierProvider
    .autoDispose<FarmMonitoringDashboardNotifier, FarmMonitoringDashboardState>(
  (ref) => FarmMonitoringDashboardNotifier(
    FarmMonitoringDashboardState(
      farmMonitoringDashboardModel: FarmMonitoringDashboardModel(),
    ),
  ),
);

class FarmMonitoringDashboardNotifier
    extends StateNotifier<FarmMonitoringDashboardState> {
  FarmMonitoringDashboardNotifier(FarmMonitoringDashboardState state)
      : super(state) {
    initialize();
  }

  void initialize() {
    final infoCards = [
      InfoCardModel(
        title: 'Crop Health',
        value: 'Good',
        hasGradient: true,
        hasArrow: true,
        valueColor: appTheme.colorFF4276,
      ),
      InfoCardModel(
        title: 'Planting date',
        value: '12/01/2024',
        hasGradient: false,
        hasArrow: false,
        valueColor: appTheme.colorFF0D18,
      ),
      InfoCardModel(
        title: 'Expenses',
        value: '\$2,314.00',
        subtitle: '-10%',
        hasGradient: false,
        hasArrow: true,
        valueColor: appTheme.colorFF0D18,
        subtitleColor: appTheme.colorFF4276,
      ),
      InfoCardModel(
        title: 'Harvest time',
        value: '~4 Months',
        hasGradient: false,
        hasArrow: false,
        valueColor: appTheme.colorFF0D18,
      ),
    ];

    final weatherModel = WeatherModel(
      temperature: '24°',
      period: 'Today',
      icon: ImageConstant.imgGroup46,
    );

    final characteristicCards = [
      CharacteristicCardModel(
        icon: ImageConstant.imgFrame1171276460,
        title: 'Nutrient',
        status: 'Soon',
        statusColor: appTheme.colorFF4276,
      ),
      CharacteristicCardModel(
        icon: ImageConstant.imgFrame1171276450,
        title: 'Soil',
        status: 'Soon',
        statusColor: appTheme.colorFF4276,
      ),
    ];

    state = state.copyWith(
      infoCards: infoCards,
      weatherModel: weatherModel,
      characteristicCards: characteristicCards,
      selectedTabIndex: 1,
      selectedPeriod: 'Days',
      selectedChart: 'height',
    );
  }

  void switchTab(int index) {
    state = state.copyWith(
      selectedTabIndex: index,
    );
  }

  void changePeriod(String period) {
    state = state.copyWith(
      selectedPeriod: period,
    );
  }

  void switchChart(String chart) {
    state = state.copyWith(
      selectedChart: chart,
    );
  }
}
