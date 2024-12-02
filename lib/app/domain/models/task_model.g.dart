// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$PeriodicityTypeEnumMap, json['type']),
      category: $enumDecode(_$TaskCategoryEnumMap, json['category']),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isActive': instance.isActive,
      'type': _$PeriodicityTypeEnumMap[instance.type]!,
      'category': _$TaskCategoryEnumMap[instance.category]!,
    };

const _$PeriodicityTypeEnumMap = {
  PeriodicityType.daily: 'daily',
  PeriodicityType.weekly: 'weekly',
};

const _$TaskCategoryEnumMap = {
  TaskCategory.work: 'work',
  TaskCategory.home: 'home',
  TaskCategory.meetings: 'meetings',
};
