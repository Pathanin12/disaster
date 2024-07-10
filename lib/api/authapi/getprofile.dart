
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/cookie/cookie.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/router.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../model/createevenmodel.dart';
import '../../model/profilemodel.dart';
import '../../model/profileusermodel.dart';
import '../../screen/drawer/admin/contollerdraweradmin.dart';

Future<ProfileModel>checkProfile({required String apikey})async{
  CookieSP().delDataUser();
  final LandingPageControllerAdmin landingPageController =
  Get.put(LandingPageControllerAdmin(), permanent: false);
  ProfileModel? dataDashBoard =ProfileModel();
  try{
    await HttpRequest.LoginToken().then((token) async{
      // print("TOKEN $token");
      Dio dio=Dio();
      final data = await dio.post('${url}Profile',data: {
        "token" : apikey
      },
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
      if(data.statusCode==200){
        dataDashBoard = ProfileModel.fromJson(data.data);
      if(dataDashBoard!.success==true){
        if(dataDashBoard!.user!.profile!.role==3){
          isAdmin=false;
          isVillager = false;
          landingPageController.dataUser!.value= ProfileSaveModel(
              profile: ProfileSave(name:dataDashBoard!.user!.profile!.name,
                  username: dataDashBoard!.user!.profile!.username,
                  refId: dataDashBoard!.user!.profile!.refId,
                role: dataDashBoard!.user!.profile!.role,
                provinceName: dataDashBoard!.user!.profile!.provinceName,
              )
          );
          CookieSP().insertDataUsers(user: ProfileSaveModel(
              profile: ProfileSave(name:dataDashBoard!.user!.profile!.name,
                  username: dataDashBoard!.user!.profile!.username,
                  refId: dataDashBoard!.user!.profile!.refId,
                role: dataDashBoard!.user!.profile!.role,
                provinceName: dataDashBoard!.user!.profile!.provinceName,
              )
          ));
          Get.toNamed(RouterName.adminPage);
        }else {
          isAdmin=true;
          isVillager = false;
          landingPageController.dataUser!.value= ProfileSaveModel(
              profile: ProfileSave(name:dataDashBoard!.user!.profile!.name,
                  username: dataDashBoard!.user!.profile!.username,
                  refId: dataDashBoard!.user!.profile!.refId,
                role: dataDashBoard!.user!.profile!.role,
                provinceName: dataDashBoard!.user!.profile!.provinceName,
              )
          );
          CookieSP().insertDataUsers(user: ProfileSaveModel(
              profile: ProfileSave(name:dataDashBoard!.user!.profile!.name,
                  username: dataDashBoard!.user!.profile!.username,
                  refId: dataDashBoard!.user!.profile!.refId,
                role: dataDashBoard!.user!.profile!.role,
                provinceName: dataDashBoard!.user!.profile!.provinceName,
              )
          ));
          Get.toNamed(RouterName.adminPage);
        }
      }else{
        isVillager = true;
        Get.toNamed(RouterName.userPage);
      }
      }
    });
    return dataDashBoard!;
  }catch(e){
    print('ERROR CHECK APIKEY=>$e');
    isVillager = true;
    Get.offAndToNamed(RouterName.userPage);
    return dataDashBoard!;
  }
  return dataDashBoard!;
}