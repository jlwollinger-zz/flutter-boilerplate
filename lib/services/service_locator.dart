import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_boilerplate/security/interceptors/token_interceptor.dart';
import 'package:login_boilerplate/services/login_service.dart';
import 'package:login_boilerplate/services/persistence/file_persistence.dart';
import 'package:login_boilerplate/services/profile_service.dart';
import 'package:login_boilerplate/widgets/app_config.dart';

GetIt locator = GetIt.I;

//Services registry and global models
void setupLocator(AppConfig appConfig, {String token}) {
  locator.registerSingleton(_createHTTPClient(appConfig.apiBaseUrl, token));
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => FilePersistence());
  locator.registerLazySingleton(() => ProfileService());
}

Dio _createHTTPClient(String baseUrl, String token) {
  BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 20000,
    receiveTimeout: 120000,
  );
  final dio = new Dio(options);
  if (token != null) {
    dio.interceptors.add(new TokenInterceptor(token));
  }
  return dio;
}
