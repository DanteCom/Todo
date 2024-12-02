// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NutritionModel _$NutritionModelFromJson(Map<String, dynamic> json) =>
    NutritionModel(
      id: json['id'] as String,
      weeks: (json['weeks'] as List<dynamic>)
          .map((e) => Weeks.fromJson(Map.from(e)))
          .toList(),
      category: TextIconModel.fromJson(Map.from(json['category'])),
      calories: json['calories'] as String,
    );

Map<String, dynamic> _$NutritionModelToJson(NutritionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'calories': instance.calories,
      'category': instance.category.toJson(),
      'weeks': List.from(instance.weeks.map((e) => e.toJson())),
    };
