import '../../../core/app_export.dart';

class FarmMonitoringDashboardModel extends Equatable {
  FarmMonitoringDashboardModel({
    this.fieldTitle,
    this.fieldImage,
    this.satelliteText,
  }) {
    fieldTitle = fieldTitle ?? 'Tomatoes Field';
    fieldImage = fieldImage ?? ImageConstant.imgImage7;
    satelliteText = satelliteText ?? 'Generate by Satellite imagery services';
  }

  String? fieldTitle;
  String? fieldImage;
  String? satelliteText;

  FarmMonitoringDashboardModel copyWith({
    String? fieldTitle,
    String? fieldImage,
    String? satelliteText,
  }) {
    return FarmMonitoringDashboardModel(
      fieldTitle: fieldTitle ?? this.fieldTitle,
      fieldImage: fieldImage ?? this.fieldImage,
      satelliteText: satelliteText ?? this.satelliteText,
    );
  }

  @override
  List<Object?> get props => [
        fieldTitle,
        fieldImage,
        satelliteText,
      ];
}
