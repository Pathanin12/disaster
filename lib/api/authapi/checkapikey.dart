

import 'package:dio/dio.dart';

import '../../service/config.dart';

Future<String?>checkApiKey(String key)async{
  try{
    Dio dio=Dio();
    final result=await dio.post('${urlApiKey}valid?apikey=$key',options: Options(headers: {
      "Content-Type":"application/json",
      "Accept":"application/json"
    }));
    if(result.statusCode==200){
      Map<String,dynamic> data = result.data;
      print(data['token']);
      return data['token'];
    }
  }catch(e){
    print('ERROR CheckApiKey => $e');
    return null;
  }
}