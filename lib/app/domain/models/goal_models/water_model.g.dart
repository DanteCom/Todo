// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterModel _$WaterModelFromJson(Map<String, dynamic> json) => WaterModel(
      id: json['id'] as String,
      ml: json['ml'] as String,
      weeks: (json['weeks'] as List<dynamic>)
          .map((e) => Weeks.fromJson(Map.from(e)))
          .toList(),
      category: TextIconModel.fromJson(Map.from(json['category'])),
    );

Map<String, dynamic> _$WaterModelToJson(WaterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ml': instance.ml,
      'category': instance.category.toJson(),
      'weeks': List.from(instance.weeks.map((e) => e.toJson())),
    };
