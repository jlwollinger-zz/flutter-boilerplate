import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_boilerplate/services/login_service.dart';
import 'package:login_boilerplate/services/service_locator.dart';

import '../routes.dart';

/*
 * Classe responsável por tratar um possível retorno HTTP 401 - Unauthorized
 * e deslogar o usuário que teve o token expirado.
 */
class UnauthorizedCatcher {
  final BuildContext context;
  final dynamic error;

  const UnauthorizedCatcher(this.context, this.error);

  validate() {
    if (error is DioError) {
      if (error.response?.statusCode == HttpStatus.unauthorized) {
        final _loginService = locator<LoginService>();
        _loginService.logout();
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    }
  }
}
