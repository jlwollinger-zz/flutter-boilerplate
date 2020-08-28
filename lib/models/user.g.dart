// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String,
    username: json['username'] as String,
    emailConfirmed: json['emailConfirmed'] as bool,
    pushNotificationId: json['pushNotificationId'] as String,
  )..urlPhoto = json['urlPhoto'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'urlPhoto': instance.urlPhoto,
      'emailConfirmed': instance.emailConfirmed,
      'pushNotificationId': instance.pushNotificationId,
    };
