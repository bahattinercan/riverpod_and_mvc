import "package:json_annotation/json_annotation.dart";

part "base_model.g.dart";

@JsonSerializable()
class BaseModel {
  int? status;
  String? message;
  int? count;
  BaseModel({
    this.status,
    this.message,
    this.count,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
