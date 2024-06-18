import 'package:app_belibeli/utils/utils.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const PATH_PREFIX = '/api/v1';

class HttClient {
  static const String _baseUrl = 'http://192.168.43.226:4000$PATH_PREFIX';

  static final dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ));

  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch (error) {
      return _handleError(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  static Future<Map<String, dynamic>> post(
      String endpoint, Object? data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (error) {
      return _handleError(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  static Future<Map<String, dynamic>> patch(
      String endpoint, Object? data) async {
    try {
      final response = await dio.patch(endpoint, data: data);
      return response.data;
    } on DioException catch (error) {
      return _handleError(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  static Future<Map<String, dynamic>> delete(
      String endpoint, Object? data) async {
    try {
      final response = await dio.delete(endpoint, data: data);
      return response.data;
    } on DioException catch (error) {
      return _handleError(error);
    } catch (error) {
      return _handleError(error);
    }
  }

  static Map<String, dynamic> _handleError(Object error) {
    if (error is DioException && error.response != null) {
      var responseError = ResponseError.fromMap(error.response?.data);
      return responseError.toMap();
    }
    return ResponseError(
      messages: ['Internal Server Error'],
      statusCode: 500,
      error: 'Internal Server Error',
    ).toMap();
  }
}
