import 'package:disaster/service/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/authapi/checkapikey.dart';
import '../../../model/profileusermodel.dart';
import '../../../service/recheckkeyapi.dart';

class LandingPageControllerAdmin extends GetxController {
  var tabIndex = 0.obs;
  Rx<ProfileModel> dataUserAdmin = ProfileModel().obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    checkApiKey();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
