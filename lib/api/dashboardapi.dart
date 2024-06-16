
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/model/dashboardmodel.dart';
import 'package:disaster/screen/dashboard/viewdashboard.dart';
import 'package:disaster/service/config.dart';

import '../../model/createevenmodel.dart';

Future<Dashboard>dashboardApi({required String startDate,required String endDate,required int level,required int disasterType,int? provinceID})async{
Dashboard? dataDashBoard =Dashboard();
  try{
   await HttpRequest.LoginToken().then((token) async{
      // print("TOKEN $token");
      Dio dio=Dio();
      final data = await dio.post('${url}GetAllDashBoard',data: {
        "disasterType":disasterType,
        "datetimeStart":startDate,
        "datetimeEnd":endDate,
        "level":level,
        if(level>0)"provinceID":provinceID
      },
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
      // print('tttt ${data.statusCode}');
      // print('tttt ${data.data}');
      if(data.statusCode==200){
        dataDashBoard = Dashboard.fromJson(data.data);
      }
    });
return dataDashBoard!;
  }catch(e){
    print('ERROR CREATE EVEN =>$e');
    return dataDashBoard!;
  }
return dataDashBoard!;
}