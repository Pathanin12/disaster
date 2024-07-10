
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/token.dart';
import '../../service/config.dart';

Future<void>getToken()async{
try{

  SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("Expire")!=null) {
      if(DateTime.now().isAfter(DateTime.parse(prefs.getString("Expire")!))) {
        Dio dio =Dio();
        var request = await dio.post('${url}Token',data: {
          "username": "aisoft",
          "password": "@pwAisoft2024"
        },options: Options(headers: {
          'Content-Type': 'application/json',
        }));

        if (request.statusCode == 200) {
          var data = request.data;
          LoginToKen token = LoginToKen.fromJson(data);
          prefs.setString("userData", token.accessToken!);
          prefs.setString('Expire', token.expires.toString());
          print('GETTOKEN Expire SUCCESS');
        }
      }
    }else{

      Dio dio =Dio();
      var request = await dio.post('${url}Token',data: {
        "username": "aisoft",
        "password": "@pwAisoft2024"
      },options: Options(headers: {
        'Content-Type': 'application/json',
      }));
      print(request.data);
      if (request.statusCode == 200) {
        var data = request.data;
        LoginToKen token = LoginToKen.fromJson(data);
        prefs.setString("userData", token.accessToken!);
        prefs.setString('Expire', token.expires.toString());

      }

    }

}catch(e){
print('ERROR GETTOKEN => $e');
}
}