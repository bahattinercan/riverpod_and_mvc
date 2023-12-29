import "dart:convert";

import "package:json_annotation/json_annotation.dart";

part "register_model.g.dart";

@JsonSerializable()
class RegisterModel {
  int? id;
  String? token;

  RegisterModel(
    this.id,
    this.token,
  );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);

  factory RegisterModel.fromRawJson(String str) => RegisterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
