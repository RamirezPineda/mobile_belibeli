import 'package:dio/dio.dart';

import 'package:app_belibeli/constants/constants.dart';
import 'package:app_belibeli/utils/utils.dart';

class HttClient {
  static final String _baseUrl = '${Environment.apiUrl}/api/v1';

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
      final headerAuthorization = response.headers['authorization'];
      if (headerAuthorization != null) {
        response.data[LocalStorage.token] = _getToken(headerAuthorization);
      }
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
      return error.response?.data;
    }
    return {
      ResponseError.messages: ['Internal Server Error'],
      ResponseError.statusCode: 500,
      ResponseError.error: 'Internal Server Error'
    };
  }

  static String _getToken(List<String>? headerAuthorization) {
    final bearerAndToken = headerAuthorization?[0].split(' ');
    if (bearerAndToken != null && bearerAndToken.length > 1) {
      return bearerAndToken[1];
    }
    return '';
  }
}
