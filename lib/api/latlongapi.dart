
import 'dart:convert';

import 'package:disaster/model/latlongmodel.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

Future<String>getLatLong({required String lat,required String long})async{
  try{
        // var headers = {'Content-Type': 'application/json'};
        var request = http.Request('GET', Uri.parse('https://nominatim.openstreetmap.org/reverse?format=xml&lat=$lat&lon=$long'));
        // request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          var data = await response.stream.bytesToString();
          final Xml2Json xml2Json = Xml2Json();
          xml2Json.parse(data);
          var jsonString = xml2Json.toParker();
          var dataConvert = jsonDecode(jsonString);
          var tutList = dataConvert['reversegeocode']['addressparts']['province'];
          String result =tutList.toString().split(" ")[0];
          // LatLongModel.
          // LoginToKen token = LoginToKen.fromJson(jsonDecode(data));
          return result;
        }
        return "";
  }catch(e){
    print('ERROR GETTOKEN => $e');
    return "";
  }
}