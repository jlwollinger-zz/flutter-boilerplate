import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  TokenInterceptor(String token)
      : super(onRequest: (RequestOptions options) {
          options.headers['Authorization'] = "Bearer " + token;
          return options;
        });
}
