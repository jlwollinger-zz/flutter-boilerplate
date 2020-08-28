// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUser _$CreateUserFromJson(Map<String, dynamic> json) {
  return CreateUser(
    nome: json['nome'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
  );
}

Map<String, dynamic> _$CreateUserToJson(CreateUser instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'username': instance.username,
      'password': instance.password,
      'birthday': instance.birthday?.toIso8601String(),
    };
