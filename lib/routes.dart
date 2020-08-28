import 'package:flutter/material.dart';
import 'package:login_boilerplate/pages/home/home.dart';
import 'package:login_boilerplate/pages/login/login.dart';
import 'package:login_boilerplate/pages/login/recuperar_senha.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String esqueciSenha = '/forget-password';


  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    Routes.home: (BuildContext context) => HomePage(),
    Routes.login: (BuildContext context) => LoginPage(),
    Routes.esqueciSenha: (BuildContext context) => RecuperarSenhaPage(),
  };
}
