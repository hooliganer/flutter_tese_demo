import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:haozuke_test/routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {

    FluroRouter arouter = FluroRouter();
    Routes.configureRoutes(arouter);

    return GetMaterialApp(

      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.green,
          onPrimary: Colors.white,
          onBackground: Colors.green,
          secondary: Colors.amber,
        ),
      ),

      onGenerateRoute: arouter.generator,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en','US'),
        Locale('zh','CN'),
      ],

    );
  }
}
