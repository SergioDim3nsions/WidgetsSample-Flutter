import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgets_sample/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es,ES')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
