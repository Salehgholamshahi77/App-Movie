

import 'package:dio/dio.dart';

class DioSirvice {
  Future<dynamic> gethome(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((responce) {
      return responce;
    });
  }
}
