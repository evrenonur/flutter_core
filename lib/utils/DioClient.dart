import 'package:dio/dio.dart';

import 'package:flutter_core/core/ApiEndpoints.dart';
import 'package:flutter_core/utils/AlertManager.dart';

import 'package:flutter_core/utils/StorageManager.dart';

class DioClient with StorageManager,AlertManager{
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = ApiEndpoints.BASE_URL;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 3000;
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.options.validateStatus = (status) {
      return status! < 500;
    };

    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await getData('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },

      onResponse: (response, handler) {
        if (response.statusCode == 401 && response.requestOptions.path != ApiEndpoints.LOGIN && response.requestOptions.path != ApiEndpoints.REGISTER) {
          clearData();
          loginTo();
        }
        return handler.next(response);
      },
    ));
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
