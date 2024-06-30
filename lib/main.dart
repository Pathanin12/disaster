import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/router.dart';
import 'package:disaster/screen/auth/fixrole.dart';
import 'package:disaster/screen/auth/viewauth.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/screen/detail/viewdetail.dart';
import 'package:disaster/screen/drawer/admin/contollerdraweradmin.dart';
import 'package:disaster/screen/drawer/admin/viewdraweradmin.dart';
import 'package:disaster/screen/drawer/user/viewdraweruser.dart';
import 'package:disaster/screen/report/mainreport/viewmainreport.dart';
import 'package:disaster/screen/villager/detail/viewdetail.dart';
import 'package:disaster/screen/villager/detailfreeform/viewdetailform.dart';
import 'package:disaster/screen/villager/viewvillager.dart';
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
      initialRoute: RouterName.login,
      getPages: [
        GetPage(
          name: RouterName.userPage,
          page: () => LandingPageUser(),
        ),
        GetPage(
          name: RouterName.dashbord,
          page: () => DashBoardPage(),
        ),
        GetPage(
          name: RouterName.mainreport,
          page: () => MainReport(),
        ),
        GetPage(
          name: RouterName.villager,
          page: () => HomeViewWeb(),
        ),
        // GetPage(
        //   name: RouterName.fixRole,
        //   page: () => const FixRole(),
        // ),
        GetPage(
          name: RouterName.login,
          page: () => AuthPage(),
        ),
        GetPage(
          name: RouterName.adminPage,
          page: () => LandingPageAdmin(),
        ),
        GetPage(
          name: RouterName.detailvalliger,
          page: () => DetailVillager(),
        ),
        GetPage(
          name: RouterName.detailother,
          page: () => DetailFreeFormVillager(),
        )
      ],
      onGenerateRoute: (settings) {
        // Handle different named routes here
        if (settings.name == RouterName.userPage) {
          return MaterialPageRoute(
            builder: (context) => LandingPageUser(),
          );
        }
        // else
        //   if (settings.name == RouterName.fixRole) {
        //   return MaterialPageRoute(
        //     builder: (context) => DetailVillager(),
        //   );
        // }
        else if (settings.name == RouterName.detailother) {
          return MaterialPageRoute(
            builder: (context) => DetailFreeFormVillager(),
          );
        }
        // else
        // if (settings.name == RouterName.detailvalliger) {
        //   return MaterialPageRoute(
        //     builder: (context) => FixRole(),
        //   );
        // }
        else if (settings.name == RouterName.villager) {
          return MaterialPageRoute(
            builder: (context) => HomeViewWeb(),
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
