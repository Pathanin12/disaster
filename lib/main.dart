import 'package:disaster/router.dart';
import 'package:disaster/screen/auth/viewauth.dart';
import 'package:disaster/screen/drawer/contollerdrawer.dart';
import 'package:disaster/screen/drawer/viewdrawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:disaster/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterName.initPage,
      getPages: [
        GetPage(
          name: RouterName.initPage,
          page: () => LandingPage(),
        ),
        GetPage(
          name: RouterName.login,
          page: () => AuthPage(),
        )
      ],
      onGenerateRoute: (settings) {
        // Handle different named routes here
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => LandingPage(),
          );
        } else if (settings.name == RouterName.login) {
          // Extract parameters from settings.arguments if needed
          return MaterialPageRoute(
            builder: (context) => AuthPage(),
          );
        }
        // Handle unknown routes here
        return MaterialPageRoute(
          builder: (context) => AuthPage(),
        );
      },
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('th', ''),
      ],
    );
  }


}
 Route<T> fadeThrough<T>(RouteSettings settings, WidgetBuilder page,
{int duration = 400}) {
return PageRouteBuilder<T>(
settings: settings,
transitionDuration: Duration(milliseconds: duration),
pageBuilder: (context, animation, secondaryAnimation) => page(context),
transitionsBuilder: (context, animation, secondaryAnimation, child) {
return  child;
},
);
}
