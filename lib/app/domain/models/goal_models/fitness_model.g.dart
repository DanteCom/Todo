// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FitnessModel _$FitnessModelFromJson(Map<String, dynamic> json) => FitnessModel(
      id: json['id'] as String,
      mins: json['mins'] as String,
      hours: json['hours'] as String?,
      weeks: (json['weeks'] as List<dynamic>)
          .map((e) => Weeks.fromJson(Map.from(e)))
          .toList(),
      category: TextIconModel.fromJson(Map.from(json['category'])),
    );

Map<String, dynamic> _$FitnessModelToJson(FitnessModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mins': instance.mins,
      'hours': instance.hours,
      'category': instance.category.toJson(),
      'weeks': List.from(instance.weeks.map((e) => e.toJson())),
    };
