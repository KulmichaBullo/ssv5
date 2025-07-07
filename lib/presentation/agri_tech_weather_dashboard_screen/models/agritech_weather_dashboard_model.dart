import '../../../core/app_export.dart';

/// This class is used in the [agritech_weather_dashboard_screen] screen.

class AgriTechWeatherDashboardModel extends Equatable {
  AgriTechWeatherDashboardModel({
    this.temperature,
    this.weatherDescription,
    this.locationText,
  }) {
    temperature = temperature ?? '24°';
    weatherDescription = weatherDescription ?? 'Today is partly sunny day!';
    locationText = locationText ?? 'Singaraja, Bali';
  }

  String? temperature;
  String? weatherDescription;
  String? locationText;

  AgriTechWeatherDashboardModel copyWith({
    String? temperature,
    String? weatherDescription,
    String? locationText,
  }) {
    return AgriTechWeatherDashboardModel(
      temperature: temperature ?? this.temperature,
      weatherDescription: weatherDescription ?? this.weatherDescription,
      locationText: locationText ?? this.locationText,
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        weatherDescription,
        locationText,
      ];
}
