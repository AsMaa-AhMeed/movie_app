import 'package:flutter/material.dart';
import 'package:movie_app/presentation/manager/theme_manager.dart';
import 'package:movie_app/presentation/screens/screens.dart';

import 'presentation/manager/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: getApplicationLightTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
