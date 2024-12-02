import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/resources/resources.dart';
part 'habit_model.g.dart';

@JsonSerializable()
class HabitModel {
  String id;
  String name;
  String repetitions;
  PeriodicityType type;
  TextIconModel category;

  HabitModel({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.repetitions,
  });

  static List<TextIconModel> categories = [
    TextIconModel(icon: Vectors.run, title: HabitCategory.values[0].name),
    TextIconModel(icon: Vectors.apple, title: HabitCategory.values[1].name),
    TextIconModel(icon: Vectors.moon, title: HabitCategory.values[2].name),
    TextIconModel(icon: Vectors.flower, title: HabitCategory.values[3].name),
    TextIconModel(icon: Vectors.book, title: HabitCategory.values[4].name),
    TextIconModel(icon: Vectors.paint, title: HabitCategory.values[5].name),
    TextIconModel(icon: Vectors.cube, title: HabitCategory.values[6].name),
  ];

  static Future<void> addOrEdit(HabitModel habit) async {
    final box = Hive.box('habits');

    await box.put(habit.id, habit.toJson());
  }

  Future<void> delete() async {
    final box = Hive.box('habits');

    await box.delete(id);
  }

  static Future<List<HabitModel>> getAll() async {
    final values = Hive.box('habits').values;

    return values.map((e) => HabitModel.fromJson(Map.from(e))).toList();
  }

  Map<String, dynamic> toJson() => _$HabitModelToJson(this);

  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);
}

enum HabitCategory {
  @JsonValue("sport")
  sport,
  @JsonValue("nutrition")
  nutrition,
  @JsonValue("sleep")
  sleep,
  @JsonValue("meditation")
  meditation,
  @JsonValue("reading")
  reading,
  @JsonValue("creativity")
  creativity,
  @JsonValue("other")
  other,
}
