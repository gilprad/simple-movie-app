library app_http_client;

import 'package:dio/dio.dart';

import 'dio_base.dart';

export 'dio_base.dart';
export 'dio_exception.dart';

class AppHttp {
  static final AppHttpClient client = AppHttpClient(
    client: Dio(BaseOptions(
        baseUrl: 'https://api.themoviedb.org/3/',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        queryParameters: {'api_key': '43ccd8392281a302d29f5a935cf5e326'})),
  );
}
