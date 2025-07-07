import '../../../core/app_export.dart';

class WeatherModel extends Equatable {
  WeatherModel({
    this.temperature,
    this.period,
    this.icon,
  }) {
    temperature = temperature ?? '';
    period = period ?? '';
    icon = icon ?? '';
  }

  String? temperature;
  String? period;
  String? icon;

  WeatherModel copyWith({
    String? temperature,
    String? period,
    String? icon,
  }) {
    return WeatherModel(
      temperature: temperature ?? this.temperature,
      period: period ?? this.period,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [
        temperature,
        period,
        icon,
      ];
}
