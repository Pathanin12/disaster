import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logintoken.dart';
class HttpRequest {

  static Future<String?> LoginToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token ;
   if(prefs.getString("userData")!=null){
     if(DateTime.now().isAfter(DateTime.parse(prefs.getString("Expire")!))){
      await getToken();
       token = prefs.getString("userData")!;
     }else{
       token = prefs.getString("userData")!;
     }
   }else{
     await getToken();

     token = prefs.getString("userData")!;
   }

    return token;
  }

  static Future<void> signOutToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  //
  // static Dio dio =
  //     Dio(BaseOptions(connectTimeout:const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 30)))
  //       ..httpClientAdapter
  //       ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'}
  //       ..interceptors.addAll([
  //         PrettyDioLogger(
  //           requestHeader: false,
  //           requestBody: true,
  //           responseBody: false,
  //           responseHeader: false,
  //           compact: false,
  //         ),
  //       ])
  //       ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //        // เก็บ token
  //         // Do something before request is sent
  //         getPrefs().then((val) {
  //           if (val != null) {
  //             var json = jsonDecode(val);
  //             if (json["accessToken"] != null) {
  //               options.headers.addAll(
  //                   {"Authorization": "Bearer ${json["accessToken"]} "});
  //             }
  //           }
  //         });
  //
  //         return handler.next(options); //continue
  //         // If you want to resolve the request with some custom data，
  //         // you can resolve a `Response` object eg: return `dio.resolve(response)`.
  //         // If you want to reject the request with a error message,
  //         // you can reject a `DioError` object eg: return `dio.reject(dioError)`
  //       }, onResponse: (response, handler) {
  //         // Do something with response data
  //         return handler.next(response); // continue
  //         // If you want to reject the request with a error message,
  //         // you can reject a `DioError` object eg: return `dio.reject(dioError)`
  //       }, onError: (DioError e, handler) {
  //         // Do something with response error
  //         // final r = e.response;
  //         // if (r?.statusCode == 401) {
  //         //   signOutToken();
  //         // }
  //         // if (e.response == null) return handler.next(e);
  //         // return handler.resolve(e.response!); //continue
  //         // If you want to resolve the request with some custom data，
  //         // you can resolve a `Response` object eg: return `dio.resolve(response)`.
  //       }));
  //
  //
  // static Future<T> get<T>(String url,
  //     {Map<String, dynamic>? params, Options? options}) async {
  //     final response =
  //         await dio.get<T>(url, queryParameters: params, options: options);
  //     print('response : $response');
  //    return response.data!;
  // }
  //
  // static Future<T> post<T>(String url,
  //     {data, Map<String, dynamic>? params, Options? options}) async {
  //   Response<T> response = await dio.post<T>(url, data: data, queryParameters: params, options: options);
  //   print('response : $response');
  //   return response.data!;
  // }
  //
  // static Future<T> put<T>(
  //   String url, {
  //   data,
  //   Map<String, dynamic>? params,
  //   Options? options,
  // }) async {
  //   Response<T> response = await dio.put<T>(
  //     url,
  //     data: data,
  //     queryParameters: params,
  //     options: options,
  //   );
  //   print('response : $response');
  //   return response.data!;
  // }
  //
  // static Future<T> patch<T>(
  //   String url, {
  //   data,
  //   Map<String, dynamic>? params,
  //   Options? options,
  // }) async {
  //   Response<T> response = await dio.patch<T>(
  //     url,
  //     data: data,
  //     queryParameters: params,
  //     options: options,
  //   );
  //   print('response : $response');
  //   return response.data!;
  // }
  //
  // static Future<T> delete<T>(
  //   String url, {
  //   data,
  //   Map<String, dynamic>? params,
  //   Options?options,
  // }) async {
  //   Response<T> response = await dio.delete<T>(
  //     url,
  //     data: data,
  //     queryParameters: params,
  //     options: options,
  //   );
  //   print('response : $response');
  //   return response.data!;
  // }
  //
  // // static dynamic _returnResponse(Response response) {
  // //   switch (response.statusCode) {
  // //     case 200:
  // //       var responseJson = response.data;
  // //       return responseJson;
  // //     case 400:
  // //       throw BadRequestException(response.data.toString());
  // //     case 401:
  // //       throw UnauthorisedException(response.data.toString());
  // //     case 403:
  // //       throw UnauthorisedException(response.data.toString());
  // //     case 500:
  // //       throw InternalServerException(response.data.toString());
  // //     default:
  // //       throw FetchDataException(
  // //           'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  // //   }
  // // }
}
