import 'package:dio/dio.dart';
import 'package:disaster/api/apiservice/dio/http.dart';
import 'package:disaster/service/config.dart';

// api
Future<void> createPeopleNews(
  List<String> imageList,
  String? eventID,
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
            "eventID": eventID,
            "name": isChecked ? "ไม่ระบุตัวตน" : name,
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
