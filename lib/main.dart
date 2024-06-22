import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/router.dart';
import 'package:disaster/screen/auth/fixrole.dart';
import 'package:disaster/screen/auth/viewauth.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/screen/drawer/admin/contollerdraweradmin.dart';
import 'package:disaster/screen/drawer/admin/viewdraweradmin.dart';
import 'package:disaster/screen/drawer/user/viewdraweruser.dart';
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
      initialRoute: RouterName.fixRole,
      getPages: [
        GetPage(
          name: RouterName.userPage,
          page: () => LandingPageUser(),
        ),
        GetPage(
          name: RouterName.fixRole,
          page: () => const FixRole(),
        ),
        GetPage(
          name: RouterName.login,
          page: () => AuthPage(),
        ),
        GetPage(
          name: RouterName.adminPage,
          page: () => LandingPageAdmin(),
        )
      ],
      onGenerateRoute: (settings) {
        // Handle different named routes here
        if (settings.name == RouterName.userPage) {
          return MaterialPageRoute(
            builder: (context) => LandingPageUser(),
          );
        }else
          if (settings.name == RouterName.fixRole) {
          return MaterialPageRoute(
            builder: (context) => FixRole(),
          );
        } else if (settings.name == RouterName.adminPage) {
          return MaterialPageRoute(
            builder: (context) => LandingPageAdmin(),
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
