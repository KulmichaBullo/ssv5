part of 'agritech_weather_dashboard_notifier.dart';

class AgriTechWeatherDashboardState extends Equatable {
  final AgriTechWeatherDashboardModel? agriTechWeatherDashboardModel;
  final List<WeatherStatModel>? weatherStats;
  final List<FieldItemModel>? fieldItems;
  final List<TaskItemModel>? taskItems;

  const AgriTechWeatherDashboardState({
    this.agriTechWeatherDashboardModel,
    this.weatherStats,
    this.fieldItems,
    this.taskItems,
  });

  @override
  List<Object?> get props => [
        agriTechWeatherDashboardModel,
        weatherStats,
        fieldItems,
        taskItems,
      ];

  AgriTechWeatherDashboardState copyWith({
    AgriTechWeatherDashboardModel? agriTechWeatherDashboardModel,
    List<WeatherStatModel>? weatherStats,
    List<FieldItemModel>? fieldItems,
    List<TaskItemModel>? taskItems,
  }) {
    return AgriTechWeatherDashboardState(
      agriTechWeatherDashboardModel:
          agriTechWeatherDashboardModel ?? this.agriTechWeatherDashboardModel,
      weatherStats: weatherStats ?? this.weatherStats,
      fieldItems: fieldItems ?? this.fieldItems,
      taskItems: taskItems ?? this.taskItems,
    );
  }
}
