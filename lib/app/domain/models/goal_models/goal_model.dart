import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/resources/resources.dart';
part 'goal_model.g.dart';

@JsonSerializable()
class GoalModel {
  String id;
  String name;
  WaterModel? water;
  FitnessModel? fitness;
  NutritionModel? nutrition;

  GoalModel({
    required this.id,
    required this.name,
    required this.water,
    required this.fitness,
    required this.nutrition,
  });

  static List<TextIconModel> types = [
    TextIconModel(icon: Vectors.yoga, title: GoalCategory.values[0].name),
    TextIconModel(icon: Vectors.water, title: GoalCategory.values[1].name),
    TextIconModel(icon: Vectors.food, title: GoalCategory.values[2].name),
  ];

  GoalModel copyWith({
    String? id,
    String? name,
    required WaterModel? water,
    required FitnessModel? fitness,
    required NutritionModel? nutrition,
  }) {
    return GoalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      water: water,
      fitness: fitness,
      nutrition: nutrition,
    );
  }

  static Future<void> addOrEdit(GoalModel goal) async {
    final box = Hive.box('goals');

    await box.put(goal.id, goal.toJson());
  }

  static Future<void> delete(GoalModel goal, GoalCategory category) async {
    final box = Hive.box('goals');

    if (goal.fitness == null && goal.water == null) {
      return await box.delete(goal.id);
    }

    if (goal.fitness == null && goal.nutrition == null) {
      return await box.delete(goal.id);
    }

    if (goal.water == null && goal.nutrition == null) {
      return await box.delete(goal.id);
    }

    if (category == GoalCategory.fitness) {
      final newGoal = goal.copyWith(
        water: goal.water,
        fitness: null,
        nutrition: goal.nutrition,
      );

      return await box.put(goal.id, newGoal.toJson());
    }
    if (category == GoalCategory.water) {
      final newGoal = goal.copyWith(
        water: null,
        fitness: goal.fitness,
        nutrition: goal.nutrition,
      );

      return await box.put(goal.id, newGoal.toJson());
    }
    if (category == GoalCategory.nutrition) {
      final newGoal = goal.copyWith(
        water: goal.water,
        fitness: goal.fitness,
        nutrition: null,
      );

      return await box.put(goal.id, newGoal.toJson());
    }
  }

  static Future<List<GoalModel>> getAll() async {
    final values = Hive.box('goals').values;

    return values.map((e) => GoalModel.fromJson(Map.from(e))).toList();
  }

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);
}

enum GoalCategory {
  @JsonValue("fitness")
  fitness,
  @JsonValue("water")
  water,
  @JsonValue("nutrition")
  nutrition,
}
