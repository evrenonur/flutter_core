import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Sunucu ile bağlantı zaman aşımına uğradı";
        break;
      case DioErrorType.receiveTimeout:
        message = "Sunucu ile bağlantı zaman aşımına uğradı";
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Sunucu ile bağlantı zaman aşımına uğradı";
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = 'Bağlantı Hatası.';
          break;
        }
        message = "Beklenmedik bir hata oluştu";
        break;
      default:
        message = "Beklenmedik bir hata oluştu";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Beklenmedik bir hata oluştu';
    }
  }

  @override
  String toString() => message;
}
