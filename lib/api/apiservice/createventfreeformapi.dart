import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/createeventfreeform.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';

Future<void> creatOrUpdateEventFreeFrom(CreateEventFreeForm freeform) async {
//
  try {
    HttpRequest.LoginToken().then((token) async {
      print(" ${freeform.toJson()}");
      Dio dio = Dio();
      final data = await dio.post('${url}CreateOrUpdateEventFreeForm',
          data: freeform.toJson(),
          options: Options(headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json'
          }));

      if (data.statusCode == 200) {
        print(data.statusCode);
        print(data.data);
      }
    });
  } catch (e) {
    print('ERROR CREATE EVEN =>$e');
  }
}
