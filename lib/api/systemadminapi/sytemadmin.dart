
import 'package:dio/dio.dart';

import '../../model/systemmodel.dart';
import '../../service/config.dart';
import '../apiservice/dio/http.dart';

Future<SystemAdminModel>getAllAdmin()async{

  SystemAdminModel? dataAmin =SystemAdminModel();
  try{

    await HttpRequest.LoginToken().then((token) async{
      // print("TOKEN $token");
      Dio dio=Dio();
      final data = await dio.get('${url}GetAllUser',
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
      if(data.statusCode==200){
        dataAmin = SystemAdminModel.fromJson(data.data);

      }
    });
    return dataAmin!;
  }catch(e){
    print('ERROR GET ADMIN =>$e');
    return dataAmin!;
  }

}