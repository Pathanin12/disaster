import 'package:dio/dio.dart';
import 'package:disaster/router.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Dio dio = Dio();
    final result = await dio.post('${urlApiKey}valid?apikey=$key',
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }));
    if (result.statusCode == 200) {
      Map<String, dynamic> data = result.data;
      final resultProfile = await dio.get('${urlApiKey}profile',
          options: Options(headers: {
            "Accept": "application/json",
            "apikey": data['token']
          }));

      if (resultProfile.statusCode == 200) {
        ProfileModel profile = ProfileModel.fromJson(resultProfile.data);
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
