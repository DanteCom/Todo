import 'package:json_annotation/json_annotation.dart';
import 'package:todo/app/domain/models/models.dart';
part 'fitness_model.g.dart';

@JsonSerializable()
class FitnessModel {
  final String id;
  final String mins;
  final String? hours;
  final List<Weeks> weeks;
  final TextIconModel category;

  FitnessModel({
    required this.id,
    required this.mins,
    required this.hours,
    required this.weeks,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$FitnessModelToJson(this);

  factory FitnessModel.fromJson(Map<String, dynamic> json) =>
      _$FitnessModelFromJson(Map.from(json));
}
