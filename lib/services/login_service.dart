import 'package:dio/dio.dart';
import 'package:login_boilerplate/constants/persistence_keys.dart';
import 'package:login_boilerplate/models/login/login_payload.dart';
import 'package:login_boilerplate/models/register/create_user.dart';
import 'package:login_boilerplate/security/interceptors/token_interceptor.dart';
import 'package:login_boilerplate/services/persistence/file_persistence.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Dio _api = locator<Dio>();
  FilePersistence _filePersistence = locator<FilePersistence>();

  Future authenticate(LoginPayload loginPayload) async {
    final response = await _api.post('/auth/signin', data: loginPayload);
    await _saveAuthentication(response);
  }

  Future<dynamic> register(CreateUser user) async {
     final response = await _api.post('/api/register', data: user);
    return response;
  }

  Future<dynamic> recoverPassword(String email) async {
     final response = await _api.post('/auth/recover', data: {'username': email});
    return response;
  }

  Future<void> logout() async {
    _api.interceptors.clear();
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
    _filePersistence.clearAll();
  }

  _saveAuthentication(Response<dynamic> response) async {
    final token = response.data["token"];

    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('token', token);
    _api.interceptors.clear();
    _api.interceptors.add(new TokenInterceptor(token));

    await _filePersistence.saveObject(
        PersistenceKeys.USER, response.data['subject']);
  }
}
