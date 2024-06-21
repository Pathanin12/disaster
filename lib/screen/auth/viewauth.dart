import 'package:disaster/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'contollerauth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContollerAuth contoller =
    Get.put(ContollerAuth(), permanent: false);
    return Scaffold(
      backgroundColor: Colors.amber,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
               child:SvgPicture.asset(
                 'assets/icons/iconlocation.svg',
                 fit: BoxFit.cover,
               ) ,
              ),
            ],
          ),
          Center(
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 50,
              )),
        ],
      )
    );
  }
}
