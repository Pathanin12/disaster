
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';
import '../../model/freeformbyidmodel.dart';


Future<EventAllFreeFormByIDModel>getEventFreeFormByIDApi({required String Id})async{
  EventAllFreeFormByIDModel? dataDashBoard =EventAllFreeFormByIDModel();
  try{
    await HttpRequest.LoginToken().then((token) async{
      // print("TOKEN $token");
      Dio dio=Dio();
      final data = await dio.post('${url}GetEventFreeFormByID',data: {
        "eventID" : Id
      },
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
      // print('tttt ${data.statusCode}');
      // print('tttt ${data.data}');
      if(data.statusCode==200){
        dataDashBoard = EventAllFreeFormByIDModel.fromJson(data.data);
      }
    });
    return dataDashBoard!;
  }catch(e){
    print('ERROR CREATE EVEN =>$e');
    return dataDashBoard!;
  }
  return dataDashBoard!;
}