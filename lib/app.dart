import 'package:flutter/material.dart';
import 'package:login_boilerplate/routes.dart';
import 'package:login_boilerplate/stores/global/global_store.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';

class App extends StatelessWidget {
  final String initialRoute;

  App({this.initialRoute = Routes.login});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<GlobalStore>(
            create: (_) => GlobalStore(),
          ),
        ],
        child: MaterialApp(
          title: 'Boilerplate App',
          theme: appTheme,
          routes: Routes.routes,
          initialRoute: initialRoute,
          debugShowCheckedModeBanner: false,
        ));
  }
}
