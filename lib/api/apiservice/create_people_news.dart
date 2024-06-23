import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/service/config.dart';

// api
Future<void> createPeopleNews(
  List<String> imageList,
  String? name,
  String? details,
  bool isChecked,
) async {
  try {
    HttpRequest.LoginToken().then((token) async {
      Dio dio = Dio();
      List<Map<String, String>> mappedImageList =
          imageList.map((image) => {"image": image}).toList();
      final data = await dio.post('${url}CreatePeopleNews',
          data: {
            "eventID": "8bcfcf64-41f2-44b8-bc45-dd624d387ffc",
            "name": isChecked ? "ไม่ะบุตัวตน" : name,
            "anonymous": isChecked,
            "note": details ?? "",
            "imageList": mappedImageList,
          },
          options: Options(headers: {
            "Authorization": "Bearer $token",
            'Content-Type': 'application/json'
          }));

      if (data.statusCode == 200) {
        print(data.data);
        print('createPeopleNews Status => 200');
      }
    });
  } catch (e) {
    print('Error createPeopleNews => $e');
  }
}
