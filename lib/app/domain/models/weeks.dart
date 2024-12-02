import 'package:json_annotation/json_annotation.dart';
part 'weeks.g.dart';

@JsonSerializable()
class Weeks {
  String text;
  bool isActive;

  Weeks({required this.text, required this.isActive});

  Map<String, dynamic> toJson() => _$WeeksToJson(this);

  factory Weeks.fromJson(Map<String, dynamic> json) =>
      _$WeeksFromJson(Map.from(json));
}

enum PeriodicityType {
  @JsonValue("daily")
  daily,
  @JsonValue("weekly")
  weekly,
}
