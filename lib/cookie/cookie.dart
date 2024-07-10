// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/profileusermodel.dart';


class CookieSP {
  Future openSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> insertDataUsers({required ProfileSaveModel user}) async {
    bool result;
    try {
      var db = await openSP();
      String? useruuid = db.getString('username');
      if (useruuid == null) {
        await db.setString('username', user.profile!.username!);
        await db.setString('role', user.profile!.role!.toString());
        await db.setString('refId', user.profile!.refId!);
        await db.setString('name', user.profile!.name!);
        await db.setString('provinceName', user.profile!.provinceName!);
        await db.setString('createtime',DateTime.now().toString());
      }
      // else{delDataUser();}
      result = true;
    } catch (e) {
      print("APP => insertDataUsers $e");
      result = false;
    }
    return result;
  }

  Future<List<ProfileSaveModel>?> loadAllDataSetting() async {
    var db = await openSP();
    List<ProfileSaveModel>? listResult = [];
    String? username,createtime,name,role,refId,provinceName;
    try {
      username = db.getString('username');
    name = db.getString('name');
    role = db.getString('role');
    refId = db.getString('refId');
      provinceName=db.getString('provinceName');
      createtime = db.getString('createtime');

      if (username != null&&DateTime.now().isBefore(DateTime.parse(createtime!).add(const Duration(days: 1)))) {
        listResult.add(ProfileSaveModel(
            profile:ProfileSave(name: name,refId: refId,username: username,role: int.parse(role!),provinceName:provinceName )));
      }else{
        delDataUser();
      }
    } catch (e) {
      print('ERROR COOKIE => $e');
      username = null;
    }
    return listResult;
  }

  Future<bool> delDataUser() async {
    var db = await openSP();
    try {
      await db.remove('username');
      await db.remove('name');
      await db.remove('role');
      await db.remove('refId');
      await db.remove('createtime');
      await db.remove('provinceName');

      return true;

    } catch (e) {
      print("APP => delDataUser $e");
      return true;
    }
  }

}
