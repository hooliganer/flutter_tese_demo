import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:haozuke_test/pages/home/index.dart';
import 'package:haozuke_test/pages/login.dart';
import 'package:haozuke_test/routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {

    FluroRouter arouter = FluroRouter();
    Routes.configureRoutes(arouter);

    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.green,
          onPrimary: Colors.white,
          onBackground: Colors.green,
          secondary: Colors.amber,
        ),
      ),
      onGenerateRoute: arouter.generator,
    );
  }
}
