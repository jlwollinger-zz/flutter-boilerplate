import 'dart:io';

import 'package:dio/dio.dart';
import 'package:login_boilerplate/constants/persistence_keys.dart';
import 'package:login_boilerplate/models/user.dart';
import 'package:login_boilerplate/services/persistence/file_persistence.dart';
import 'package:login_boilerplate/services/service_locator.dart';

class ProfileService {
  Dio _api = locator<Dio>();
  FilePersistence filePersistence = locator<FilePersistence>();

  Future<User> loadUser() async {
    final response = await _api.get('/user');
    return User.fromJson(response.data);
  }

  Future<User> loadUserFromDisk() async {
    var userJson = await filePersistence.getObject(PersistenceKeys.USER);
    User user = User.fromJson(userJson);
    return user;
  }

  Future<String> updatePhoto(File photo) async {
    FormData formData =
        FormData.fromMap({'file': await MultipartFile.fromFile(photo.path)});

    final response = await _api.put('/user/photo', data: formData);
    return response.data;
  }

  Future<User> updateUser(User usuario) async {
    final response = await _api.put('/user', data: usuario);
    return User.fromJson(response.data);
  }

  Future<dynamic> updateFirebaseToken(String token) async {
    final response = await _api.patch('/user/firebasetoken/$token');
    return response;
  }
}
