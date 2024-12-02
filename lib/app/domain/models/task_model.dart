import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  String id;
  String name;
  bool isActive;
  PeriodicityType type;
  TaskCategory category;

  TaskModel({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.isActive,
  });

  TaskModel copyWith({
    String? id,
    String? name,
    bool? isActive,
    PeriodicityType? type,
    TaskCategory? category,
    PeriodicityType? periodicityType,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      category: category ?? this.category,
      isActive: isActive ?? this.isActive,
    );
  }

  static Future<void> addOrEdit(TaskModel task) async {
    final box = Hive.box('tasks');

    await box.put(task.id, task.toJson());
  }

  Future<void> delete() async {
    final box = Hive.box('tasks');

    await box.delete(id);
  }

  static Future<List<TaskModel>> getAll() async {
    final values = Hive.box('tasks').values;

    return values.map((e) => TaskModel.fromJson(Map.from(e))).toList();
  }

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

enum TaskCategory {
  @JsonValue("work")
  work,
  @JsonValue("meetings")
  meetings,
  @JsonValue("home")
  home,
}
