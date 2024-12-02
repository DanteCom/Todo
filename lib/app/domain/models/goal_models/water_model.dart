import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
part 'water_model.g.dart';

@JsonSerializable()
class WaterModel {
  final String id;
  final String ml;
  final List<Weeks> weeks;
  final TextIconModel category;

  WaterModel({
    required this.id,
    required this.ml,
    required this.weeks,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$WaterModelToJson(this);

  factory WaterModel.fromJson(Map<String, dynamic> json) =>
      _$WaterModelFromJson(Map.from(json));
}
