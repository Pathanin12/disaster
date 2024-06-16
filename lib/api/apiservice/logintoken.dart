
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/token.dart';
import '../../service/config.dart';

Future<void>getToken()async{
try{
  SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("Expire")!=null) {
      if(DateTime.now().isAfter(DateTime.parse(prefs.getString("Expire")!))) {
        var headers = {'Content-Type': 'application/json'};
        var request = http.Request('POST', Uri.parse('${url}Token'));
        request.body = json.encode({
          "username": "aisoft",
          "password": "@pwAisoft2024"
        });
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          var data = await response.stream.bytesToString();
          LoginToKen token = LoginToKen.fromJson(jsonDecode(data));
          prefs.setString("userData", token.accessToken!);
          prefs.setString('Expire', token.expires.toString());
          print('GETTOKEN Expire SUCCESS');
        }
      }
    }else{
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse('${url}Token'));
      request.body = json.encode({
        "username": "admin",
        "password": "kvEpxbfbcHB4svt"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var data = await response.stream.bytesToString();
        LoginToKen token = LoginToKen.fromJson(jsonDecode(data));
        prefs.setString("userData", token.accessToken!);
        prefs.setString('Expire', token.expires.toString());
        print("TOKENAPI ${ prefs.getString("userData")}");
      }

    }

}catch(e){
print('ERROR GETTOKEN => $e');
}
}