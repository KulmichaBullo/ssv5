import '../../../core/app_export.dart';

/// This class is used in the [task_item_widget] widget.

class TaskItemModel extends Equatable {
  TaskItemModel({
    this.id,
    this.title,
    this.location,
    this.time,
    this.iconUrl,
    this.isCompleted,
  }) {
    id = id ?? '';
    title = title ?? '';
    location = location ?? '';
    time = time ?? '';
    iconUrl = iconUrl ?? '';
    isCompleted = isCompleted ?? false;
  }

  String? id;
  String? title;
  String? location;
  String? time;
  String? iconUrl;
  bool? isCompleted;

  TaskItemModel copyWith({
    String? id,
    String? title,
    String? location,
    String? time,
    String? iconUrl,
    bool? isCompleted,
  }) {
    return TaskItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      location: location ?? this.location,
      time: time ?? this.time,
      iconUrl: iconUrl ?? this.iconUrl,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        location,
        time,
        iconUrl,
        isCompleted,
      ];
}
