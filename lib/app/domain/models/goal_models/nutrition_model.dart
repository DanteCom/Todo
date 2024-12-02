import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
part 'nutrition_model.g.dart';

@JsonSerializable()
class NutritionModel {
  final String id;
  final String calories;
  final List<Weeks> weeks;
  final TextIconModel category;

  NutritionModel({
    required this.id,
    required this.weeks,
    required this.category,
    required this.calories,
  });

  Map<String, dynamic> toJson() => _$NutritionModelToJson(this);

  factory NutritionModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionModelFromJson(Map.from(json));
}
