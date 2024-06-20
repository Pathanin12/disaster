import 'dart:convert';

import 'package:disaster/model/latlongmodel.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import '../screen/createlist/contollercreatelist.dart';

Future<addressModel> getLatLong(
    {required String lat, required String long}) async {
  addressModel address = addressModel();
  try {
    // var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://nominatim.openstreetmap.org/reverse?format=xml&lat=$lat&lon=$long'));
    // request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      final Xml2Json xml2Json = Xml2Json();
      xml2Json.parse(data);
      var jsonString = xml2Json.toParker();
      var dataConvert = jsonDecode(jsonString);

      address = addressModel(
        province: dataConvert['reversegeocode']['addressparts']['province'].toString().split(" ")[0],
        amphure: dataConvert['reversegeocode']['addressparts']['city']??dataConvert['reversegeocode']['addressparts']['town'].toString(),
        tambon: dataConvert['reversegeocode']['addressparts']['municipality'].toString(),
        zipCode: dataConvert['reversegeocode']['addressparts']['postcode'].toString(),
      );
      print(address.toJson());
      // LatLongModel.
      // LoginToKen token = LoginToKen.fromJson(jsonDecode(data));
      return address;
    }
    return address;
  } catch (e) {
    print('ERROR GETTOKEN => $e');
    return address;
  }
}
