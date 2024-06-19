import 'package:disaster/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contollerauth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerAuth contoller =
    Get.put(ContollerAuth(), permanent: false);
    return Scaffold(
      body:Obx(() =>Center(
        child: InkWell(
            onTap: (){
              Get.toNamed(RouterName.initPage);
            },
            child: Text('Login : ${contoller.r.value}')),
      ),)
    );
  }
}
