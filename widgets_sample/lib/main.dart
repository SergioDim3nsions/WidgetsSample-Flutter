import 'package:flutter/material.dart';
import 'package:widgets_sample/src/pages/home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Widgets App',
        home: HomePage());
  }
}
