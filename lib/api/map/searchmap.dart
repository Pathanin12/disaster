import 'dart:convert';

import 'package:dio/dio.dart';

import '../../model/searchmap.dart';

Future<List<SearchMapModel>> searchMapApi(String search)async{
  List<SearchMapModel> listMap=[];
  try{
    Dio dio= Dio();
    final result = await dio.get('https://nominatim.openstreetmap.org/search?q=$search&format=json&polygon_kml=1&addressdetails=1');
    if(result.statusCode==200){
      return (result.data as List).map((element)=>SearchMapModel.fromJson(element)).toList();
    }
  }catch(e){
    print('ERROR Search Map => $e');
  }
  return listMap;
}