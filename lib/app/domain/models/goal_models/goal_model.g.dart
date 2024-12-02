// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalModel _$GoalModelFromJson(Map<String, dynamic> json) => GoalModel(
      id: json['id'] as String,
      name: json['name'] as String,
      water: json['water'] == null
          ? null
          : WaterModel.fromJson(Map.from(json['water'])),
      fitness: json['fitness'] == null
          ? null
          : FitnessModel.fromJson(Map.from(json['fitness'])),
      nutrition: json['nutrition'] == null
          ? null
          : NutritionModel.fromJson(Map.from(json['nutrition'])),
    );

Map<String, dynamic> _$GoalModelToJson(GoalModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'water': instance.water?.toJson(),
      'fitness': instance.fitness?.toJson(),
      'nutrition': instance.nutrition?.toJson(),
    };
