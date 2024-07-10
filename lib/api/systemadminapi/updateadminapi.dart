
import 'package:dio/dio.dart';

import '../../model/systemmodel.dart';
import '../../service/config.dart';
import '../apiservice/dio/http.dart';

Future<void>updateAdmin({required String id,required bool status,required int role})async{

  try{

    await HttpRequest.LoginToken().then((token) async{
      // print("TOKEN $token");
      Dio dio=Dio();
      final data = await dio.post('${url}UpdateUser',data: {
        "userID":id,
        "isAccept": status,
        "role": role
      },
          options: Options(headers:{"Authorization":"Bearer $token"})
      );
    });

  }catch(e){
    print('ERROR UPDATE ADMIN =>$e');

  }

}
