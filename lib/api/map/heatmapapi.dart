import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';
import '../../model/getalleventmodel.dart';
import '../../model/heatmapmodel.dart';

Future<HeatMapModel> getHeatMapApi() async {
  HeatMapModel? heatMapModel = HeatMapModel();
  try {
    await HttpRequest.LoginToken().then((token) async {
      Dio dio = Dio();
      final data = await dio.get('${url}GetAllProvinces',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (data.statusCode == 200) {
        // print(data.data);
        heatMapModel = HeatMapModel.fromJson(data.data);
        // if (heatMapModel!.eventList!.isNotEmpty) {
        //   dataDashBoard!.eventList!.sort((a, b) => a.seq!.compareTo(b.seq!));
        //
        // }
      }
    });
    return heatMapModel!;
  } catch (e) {
    print('ERROR REPORT =>$e');
    return heatMapModel!;
  }
  return heatMapModel!;
}
