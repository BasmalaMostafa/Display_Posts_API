import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> getData({
    required String url,
  }) async{
    return await dio.get(url);
  }
}