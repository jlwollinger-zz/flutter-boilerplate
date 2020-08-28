import 'package:json_annotation/json_annotation.dart';
part 'login_payload.g.dart';

@JsonSerializable()
class LoginPayload {
  String username;

  String password;

  LoginPayload(this.username, this.password);

  factory LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$LoginPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$LoginPayloadToJson(this);
}
