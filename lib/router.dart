


import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class RouterName{
  static String initPage='/';
  static String login='/login';
  static String adminPage='/AdminPage';
  static String userPage='/UserPage';
  // static String fixRole='/FixRole';
  static String villager='/villager';
  static String detailvalliger='/Detail';
  static String detailother='/DetailOther';
  static String dashbord='/dashbord';
  static String mainreport='/MainReport';
}

Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
{int duration = 400}) {
return PageRouteBuilder<T>(
settings: settings,
transitionDuration: Duration(milliseconds: duration),
pageBuilder: (context, animation, secondaryAnimation) => page(context),
transitionsBuilder: (context, animation, secondaryAnimation, child) {
return FadeScaleTransition(animation: animation, child: child);
},
);
}