import 'package:json_annotation/json_annotation.dart';
part 'text_icon_model.g.dart';

@JsonSerializable()
class TextIconModel {
  String icon;
  String title;

  TextIconModel({required this.icon, required this.title});

  Map<String, dynamic> toJson() => _$TextIconModelToJson(this);

  factory TextIconModel.fromJson(Map<String, dynamic> json) =>
      _$TextIconModelFromJson(Map.from(json));
}
