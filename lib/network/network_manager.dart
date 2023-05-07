import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkManager {
  final String _baseUrl;
  static final Dio _dio = Dio();

  NetworkManager( this._baseUrl) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['api-key'] = dotenv.env['APIKey']!;
        return handler.next(options);
      },
    ));
  }

  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? parameters}) async {
    try {
      final response =
          await _dio.get("$_baseUrl$endpoint", queryParameters: parameters);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post("$_baseUrl+$endpoint", data: data);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> put(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.put("$_baseUrl+$endpoint", data: data);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final response = await _dio.delete("$_baseUrl+$endpoint");
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
