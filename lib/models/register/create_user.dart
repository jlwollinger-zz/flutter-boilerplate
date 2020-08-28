import 'package:json_annotation/json_annotation.dart';
part 'create_user.g.dart';

@JsonSerializable()
class CreateUser {
  String nome;
  String username; //E-mail
  String password;
  DateTime bornDate;

  CreateUser(
      {this.nome, this.username, this.password, this.bornDate});

  factory CreateUser.fromJson(Map<String, dynamic> json) =>
      _$CreateUserFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserToJson(this);
}
