


import 'package:disaster/router.dart';
import 'package:disaster/service/config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/authapi/checkapikey.dart';
import '../api/authapi/getprofileapi.dart';
import '../screen/drawer/admin/contollerdraweradmin.dart';

Future<void>CheckApiKeyLogin()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? apikey=  prefs.getString('apikey');
  if(apikey!=null) {
    try {
      await checkApiKey(apikey).then((value) =>
          GetProFileApi(value).then((value) => CheckInitPage(value)));
    } catch (e) {
      CheckInitPage(false);
    }
  }else{
    dataUser=null;
    Get.toNamed(RouterName.userPage);
  }
}

Future<void>CheckInitPage(value)async{
  if(value==true){
    if(dataUser!=null){
      Get.toNamed(RouterName.adminPage);
    }else{
      Get.toNamed(RouterName.userPage);
    }
  }else{
    Get.toNamed(RouterName.userPage);
  }
}