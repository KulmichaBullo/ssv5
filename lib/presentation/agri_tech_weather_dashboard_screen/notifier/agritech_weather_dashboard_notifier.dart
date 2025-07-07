import '../models/agritech_weather_dashboard_model.dart';
import '../models/field_item_model.dart';
import '../models/task_item_model.dart';
import '../models/weather_stat_model.dart';
import '../../../core/app_export.dart';

part 'agritech_weather_dashboard_state.dart';

final agriTechWeatherDashboardNotifier = StateNotifierProvider.autoDispose<
    AgriTechWeatherDashboardNotifier, AgriTechWeatherDashboardState>(
  (ref) => AgriTechWeatherDashboardNotifier(
    AgriTechWeatherDashboardState(
      agriTechWeatherDashboardModel: AgriTechWeatherDashboardModel(),
    ),
  ),
);

class AgriTechWeatherDashboardNotifier
    extends StateNotifier<AgriTechWeatherDashboardState> {
  AgriTechWeatherDashboardNotifier(AgriTechWeatherDashboardState state)
      : super(state) {
    initialize();
  }

  void initialize() {
    final weatherStats = [
      WeatherStatModel(
        value: '77%',
        label: 'Humidity',
      ),
      WeatherStatModel(
        value: '< 0.01 in',
        label: 'Precipitation',
      ),
      WeatherStatModel(
        value: '6 mph/s',
        label: 'Wind Speed',
      ),
    ];

    final fieldItems = [
      FieldItemModel(
        id: 'tomatoes',
        name: 'Tomatoes',
        area: '1,2 Ha',
        status: 'Good',
        statusColor: appTheme.colorFF4276,
        imageUrl: ImageConstant.imgRectangle4,
        statusIconUrl: ImageConstant.imgMaskGroup,
        isGoodStatus: true,
      ),
      FieldItemModel(
        id: 'lettuce',
        name: 'Lettuce',
        area: '1,6 Ha',
        status: 'Need Water',
        statusColor: appTheme.colorFF0D18,
        imageUrl: ImageConstant.imgRectangle4120x160,
        statusIconUrl: ImageConstant.imgMaskGroupWhiteA700,
        isGoodStatus: false,
      ),
      FieldItemModel(
        id: 'rice',
        name: 'Rice',
        area: '2,6 Ha',
        status: 'Good',
        statusColor: appTheme.colorFF4276,
        imageUrl: ImageConstant.imgRectangle4120x173,
        statusIconUrl: ImageConstant.imgMaskGroupWhiteA700,
        isGoodStatus: true,
        hasBottomStatus: true,
      ),
    ];

    final taskItems = [
      TaskItemModel(
        id: 'watering',
        title: 'Watering',
        location: 'Tomatoes Field',
        time: '10:10 AM',
        iconUrl: ImageConstant.imgFrame31,
        isCompleted: false,
      ),
      TaskItemModel(
        id: 'weeding',
        title: 'Weeding',
        location: 'Tomatoes Field',
        time: '10:10 AM',
        iconUrl: ImageConstant.imgFrame31,
        isCompleted: false,
      ),
    ];

    state = state.copyWith(
      weatherStats: weatherStats,
      fieldItems: fieldItems,
      taskItems: taskItems,
    );
  }

  void toggleTask(TaskItemModel taskItem) {
    final updatedTaskItems = state.taskItems?.map((task) {
      if (task.id == taskItem.id) {
        return task.copyWith(
          isCompleted: !(task.isCompleted ?? false),
        );
      }
      return task;
    }).toList();

    state = state.copyWith(
      taskItems: updatedTaskItems,
    );
  }
}
