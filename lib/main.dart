

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_boilerplate/app.dart';
import 'package:login_boilerplate/routes.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:login_boilerplate/utils/app_preferences.dart';
import 'package:login_boilerplate/widgets/app_config.dart';
import '.env.dart';

main() async {
  initApp();
}

initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await AppPreferences.getToken();

  var appConfig = AppConfig(
      apiBaseUrl: environment["baseUrl"],
      child: App(
        initialRoute: token != null ? Routes.home : Routes.login,
      ));
  setupLocator(appConfig, token: token);
  await SystemChrome.setPreferredOrientations(([DeviceOrientation.portraitUp]));
  runApp(appConfig);
}
