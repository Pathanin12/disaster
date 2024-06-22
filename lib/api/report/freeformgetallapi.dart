

import 'package:dio/dio.dart';

import '../../model/allfreeformmodel.dart';
import '../../service/config.dart';

Future<EventAllFreeFormModel?>GetAllFreeFormApi()async{

  try{
    Dio dio=Dio();
    final result = await dio.post('${url}GetAllEventFreeForm',data: {
      "datetimeStart":"2024-06-13",
      "datetimeEnd":"2024-06-14",
      "level":0,
      "provinceID":0,
      "responsibleAgency":"ลาดพร้าว",
      "statusAgency":1,
      "statusItem":1
    });
    if(result.statusCode==200){
      EventAllFreeFormModel dataList = EventAllFreeFormModel.fromJson(result.data);
      print(dataList.toJson());
      return dataList;
    }
  }catch(e){
    print('ERROR GETALLFREEFORM => $e');
  }
  return null;
}