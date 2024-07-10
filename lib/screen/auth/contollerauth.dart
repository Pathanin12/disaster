import 'package:disaster/router.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/authapi/checkapikey.dart';
import '../../api/authapi/getprofile.dart';
import '../../service/config.dart';
import '../../service/recheckkeyapi.dart';

class ContollerAuth extends GetxController {
  RxString r = ''.obs;
  checkLogin() async {
    r.value = Get.parameters['code'] ?? '';
    if (r.value != '') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('apikey', r.value);
      checkProfile(apikey: r.value);
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? key = prefs.getString('apikey');
      if (key != null) {
        await checkProfile(apikey: key);
      } else {
        isVillager = false;
        Get.toNamed(RouterName.userPage);
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // checkLogin();
    r.value = Get.parameters['code'] ?? '';
  }
}
