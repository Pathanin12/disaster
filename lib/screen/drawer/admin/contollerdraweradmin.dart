import 'package:disaster/service/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../api/authapi/checkapikey.dart';
import '../../../model/profileusermodel.dart';
import '../../../service/recheckkeyapi.dart';
import '../../createlist/viewcreatelist.dart';
import '../../dashboard/viewdashboard.dart';
import '../../detail/viewdetail.dart';
import '../../report/firereport/viewfirereport.dart';
import '../../report/floodreport/viewfloodreport.dart';
import '../../report/forestfirereport/viewforestfirereport.dart';
import '../../report/mainreport/viewmainreport.dart';
import '../../report/winestormreport/viewwinestormreport.dart';

class LandingPageControllerAdmin extends GetxController {
  var tabIndex = 0.obs;
  Rx<ProfileSaveModel>? dataUser = ProfileSaveModel().obs;
  Rx<ProfileSaveModel> dataUserAdmin = ProfileSaveModel().obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // checkApiKey();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
