// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => HabitModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$PeriodicityTypeEnumMap, json['type']),
      category: TextIconModel.fromJson(Map.from(json['category'])),
      repetitions: json['repetitions'] as String,
    );

Map<String, dynamic> _$HabitModelToJson(HabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'repetitions': instance.repetitions,
      'category': instance.category.toJson(),
      'type': _$PeriodicityTypeEnumMap[instance.type]!,
    };

const _$PeriodicityTypeEnumMap = {
  PeriodicityType.daily: 'daily',
  PeriodicityType.weekly: 'weekly',
};
