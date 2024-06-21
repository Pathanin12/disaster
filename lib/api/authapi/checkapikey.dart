import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/router.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../model/profileusermodel.dart';
import '../../screen/drawer/admin/contollerdraweradmin.dart';
import '../../service/config.dart';

Future<void> checkApiKey({String? keyApi}) async {
  try {
    String? key = '';
    if (keyApi == null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      key = prefs.getString('apikey');
    } else {
      key = keyApi;
    }


    var result =await http.post(Uri.parse('${urlApiKey}valid?apikey=$key'),headers:{
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'} );

    print('dsdsdsdsdsdsdsd');
    print(result.statusCode);
    if (result.statusCode == 200) {
      String data = result.body;
      Map dataMap = jsonDecode(data);
      

      var headersProfile = {
      "Access-Control-Allow-Origin": "*",
        'Accept': '*/*',
        "apikey": dataMap['token'].toString()};
      var requestProfile = http.Request('GET', Uri.parse('${urlApiKey}profile'));
      requestProfile.headers.addAll(headersProfile);
      http.StreamedResponse resultProfile = await requestProfile.send();
      if (resultProfile.statusCode == 200) {
        String r =await resultProfile.stream.bytesToString();
        ProfileModel profile = ProfileModel.fromJson(jsonDecode(r));
        final LandingPageControllerAdmin landingPageController =
            Get.put(LandingPageControllerAdmin(), permanent: false);
        landingPageController.dataUserAdmin.value = profile;
        dataUser = profile;
        Get.toNamed(RouterName.adminPage);
      }
    }
  } catch (e) {
    print('ERROR CheckApiKey => $e');
    Get.toNamed(RouterName.userPage);
  }
}
