import 'package:dio/dio.dart';
import 'package:disaster/service/config.dart';
import 'package:get/get.dart';

import '../../model/profileusermodel.dart';
import '../../screen/drawer/admin/contollerdraweradmin.dart';

Future<bool> GetProFileApi(String? key)async{
  try{
    Dio dio=Dio();
    final result =await dio.get('${urlApiKey}profile',options: Options(headers: {
      "Accept":"application/json",
      "apikey":key
    }));

    if(result.statusCode==200){
      ProfileModel profile = ProfileModel.fromJson(result.data);
      final LandingPageControllerAdmin landingPageController =
      Get.put(LandingPageControllerAdmin(), permanent: false);
      landingPageController.dataUserAdmin.value=profile;
      dataUser=profile;
      return true;
    }
  }catch(e){
    print('ERROR GetProFile => $e');
  }
  return false;
}