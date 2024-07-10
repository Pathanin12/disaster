// import 'package:dio/dio.dart';
//
// import '../../model/allfreeformmodel.dart';
// import '../../service/config.dart';
// import '../apiservice/dio/http.dart';
//
// Future<EventAllFreeFormModel> GetAllFreeFormApi( {
//   required String startDate,
//   required String endDate,
//   required int level,
//   required int statusAgency,
//   required int statusItem,
//   int? provinceID,
//   String? responsibleAgency}) async {
//   EventAllFreeFormModel? dataList=EventAllFreeFormModel();
//   try {
//
//     await HttpRequest.LoginToken().then((token) async {
//       Dio dio = Dio();
//       final result = await dio.post('${url}GetAllEventFreeForm',
//           data: {
//             "datetimeStart": startDate,
//             "datetimeEnd": endDate,
//             "level": level,
//             "provinceID":provinceID,
//             "responsibleAgency":responsibleAgency??'',
//             "statusAgency": statusAgency,
//             "statusItem": statusItem
//           },
//           options: Options(headers: {"Authorization": "Bearer $token"}));
//       if (result.statusCode == 200) {
//
//          dataList =
//             EventAllFreeFormModel.fromJson(result.data);
//          dataList!.eventList!.sort((a,b)=>a.seq!.compareTo(b.seq!));
//         return dataList;
//       }
//     });
//     return dataList!;
//   } catch (e) {
//     print('ERROR GETALLFREEFORM => $e');
//     return dataList!;
//   }
//
// }
