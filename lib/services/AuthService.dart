import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_core/core/ApiEndpoints.dart';
import 'package:flutter_core/model/Request/LoginRequest.dart';
import 'package:flutter_core/model/Request/RegisterRequestModel.dart';
import 'package:flutter_core/model/Response/LoginResponseModel.dart';
import 'package:flutter_core/model/Response/RegisterResponseModel.dart';
import 'package:flutter_core/services/interfaces/IAuthService.dart';
import 'package:flutter_core/utils/AlertManager.dart';
import 'package:flutter_core/utils/DioClient.dart';
import 'package:flutter_core/utils/DioExceptions.dart';
import 'package:flutter_core/utils/StorageManager.dart';

class AuthService with StorageManager,AlertManager implements IAuthService {
  @override
  DioClient get dioClient => DioClient(Dio());

  @override
  Future<LoginResponseModel?> login(LoginRequest request) async {
    try {
      final response = await dioClient.post(
        ApiEndpoints.LOGIN,
        data: request.toJson(),
      );
      if (response.statusCode == HttpStatus.ok) {
        final token = LoginResponseModel.fromJson(response.data);
        await setData("token", token.response!);
        return token;
      }
      if (response.statusCode == HttpStatus.unauthorized) {
          error("Hata!", "Hesabınız Askıya Alınmıştır.");
      }
      else {
        error("Hata!", "Giriş başarısız.");
      }
    } on DioError catch (e) {
      final message = DioExceptions.fromDioError(e).toString();
      throw message;
    }
  }

  @override
  Future<RegisterResponseModel?> register(RegisterRequestModel request) async {
    try {
      final response = await dioClient.post(
        ApiEndpoints.REGISTER,
        data: request.toJson(),
      );
      if (response.statusCode == HttpStatus.created) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      final message = DioExceptions.fromDioError(e).toString();
      throw message;
    }
  }
}
