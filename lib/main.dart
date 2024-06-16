import 'package:disaster/router.dart';
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
      initialRoute:RouterName.initPage,
          getPages: [
            GetPage(name: RouterName.initPage, page:()=> LandingPage(),)
          ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('th', ''),
      ],
    );
  }
}
        