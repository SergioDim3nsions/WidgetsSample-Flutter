import 'package:flutter/material.dart';
import 'package:widgets_sample/src/pages/alert_page.dart';
import 'package:widgets_sample/src/pages/animated_container.dart';
import 'package:widgets_sample/src/pages/avatar_page.dart';
import 'package:widgets_sample/src/pages/card_page.dart';
import 'package:widgets_sample/src/pages/home_page.dart';
import 'package:widgets_sample/src/pages/input_page.dart';
import 'package:widgets_sample/src/pages/listview_page.dart';
import 'package:widgets_sample/src/pages/slider_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'listview': (BuildContext context) => ListViewPage(),
  };
}
