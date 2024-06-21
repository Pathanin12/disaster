import 'package:disaster/router.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/authapi/checkapikey.dart';
import '../../service/recheckkeyapi.dart';

class ContollerAuth extends GetxController {
 var r =  ''.obs;
checkLogin()async{
  r.value=Get.parameters['code']??'';
  if(r.value!=null){
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('apikey', r.value);
    await CheckApiKeyLogin();
  }else{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? key = prefs.getString('apikey');
   if(key!=null){
     await CheckApiKeyLogin();
   }else {
     Get.toNamed(RouterName.userPage);
   }
  }
}

 @override
  void onInit() {
    // TODO: implement onInit
    checkLogin();
  }

}