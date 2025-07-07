import '../../../core/app_export.dart';

/// This class is used in the [weather_stat_widget] widget.

class WeatherStatModel extends Equatable {
  WeatherStatModel({
    this.value,
    this.label,
  }) {
    value = value ?? '';
    label = label ?? '';
  }

  String? value;
  String? label;

  WeatherStatModel copyWith({
    String? value,
    String? label,
  }) {
    return WeatherStatModel(
      value: value ?? this.value,
      label: label ?? this.label,
    );
  }

  @override
  List<Object?> get props => [
        value,
        label,
      ];
}
