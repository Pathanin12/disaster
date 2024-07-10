import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';
import '../../model/eventnamemodel.dart';
import '../../model/getalleventmodel.dart';
import '../../model/heatmapmodel.dart';

Future<EvenNameModel> getEventNameApi(int? id) async {
  print('>>>>>>>>>>>> $id');
  EvenNameModel? eventNameModel = EvenNameModel();
  try {
    await HttpRequest.LoginToken().then((token) async {
      Dio dio = Dio();
      final data = await dio.post('${url}GetAllEventName',
          data: {
            "provinceID" : id
          },
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (data.statusCode == 200) {
        eventNameModel = EvenNameModel.fromJson(data.data);
      }
    });
    return eventNameModel!;
  } catch (e) {
    print('ERROR REPORT =>$e');
    return eventNameModel!;
  }
  return eventNameModel!;
}
