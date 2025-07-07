part of 'farm_monitoring_dashboard_notifier.dart';

class FarmMonitoringDashboardState extends Equatable {
  final FarmMonitoringDashboardModel? farmMonitoringDashboardModel;
  final List<InfoCardModel>? infoCards;
  final WeatherModel? weatherModel;
  final List<CharacteristicCardModel>? characteristicCards;
  final int? selectedTabIndex;
  final String? selectedPeriod;
  final String? selectedChart;

  const FarmMonitoringDashboardState({
    this.farmMonitoringDashboardModel,
    this.infoCards,
    this.weatherModel,
    this.characteristicCards,
    this.selectedTabIndex,
    this.selectedPeriod,
    this.selectedChart,
  });

  @override
  List<Object?> get props => [
        farmMonitoringDashboardModel,
        infoCards,
        weatherModel,
        characteristicCards,
        selectedTabIndex,
        selectedPeriod,
        selectedChart,
      ];

  FarmMonitoringDashboardState copyWith({
    FarmMonitoringDashboardModel? farmMonitoringDashboardModel,
    List<InfoCardModel>? infoCards,
    WeatherModel? weatherModel,
    List<CharacteristicCardModel>? characteristicCards,
    int? selectedTabIndex,
    String? selectedPeriod,
    String? selectedChart,
  }) {
    return FarmMonitoringDashboardState(
      farmMonitoringDashboardModel:
          farmMonitoringDashboardModel ?? this.farmMonitoringDashboardModel,
      infoCards: infoCards ?? this.infoCards,
      weatherModel: weatherModel ?? this.weatherModel,
      characteristicCards: characteristicCards ?? this.characteristicCards,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      selectedPeriod: selectedPeriod ?? this.selectedPeriod,
      selectedChart: selectedChart ?? this.selectedChart,
    );
  }
}
