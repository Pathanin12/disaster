
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';
import '../../model/getalleventmodel.dart';

Future<GetAllEventModel>getAllDashBoardApi({required String startDate,required String endDate,required int level,required int disasterType,int? provinceID})async{
  GetAllEventModel? dataDashBoard =GetAllEventModel();
  try{
    await HttpRequest.LoginToken().then((token) async{
      Dio dio=Dio();
      final data = await dio.post('${url}GetAllEvent',data: {
        "disasterType":disasterType,
        "datetimeStart":startDate,
        "datetimeEnd":endDate,
        "level":level,
        if(level>0)"provinceID":provinceID
      },
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
      if(data.statusCode==200){
        dataDashBoard = GetAllEventModel.fromJson(data.data);
       if(dataDashBoard!.eventList!.isNotEmpty) {
         dataDashBoard!.eventList!.sort((a, b) => a.seq!.compareTo(b.seq!));
       }
      }
    });
    return dataDashBoard!;
  }catch(e){
    print('ERROR REPORT =>$e');
    return dataDashBoard!;
  }
  return dataDashBoard!;
}