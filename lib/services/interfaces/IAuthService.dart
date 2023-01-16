import 'package:dio/dio.dart';
import 'package:flutter_core/model/Request/LoginRequest.dart';
import 'package:flutter_core/model/Request/RegisterRequestModel.dart';
import 'package:flutter_core/model/Response/LoginResponseModel.dart';
import 'package:flutter_core/model/Response/RegisterResponseModel.dart';
import 'package:flutter_core/utils/DioClient.dart';

abstract class IAuthService{

  final DioClient dioClient = DioClient(Dio());
  Future<LoginResponseModel?> login(LoginRequest request);
  Future<RegisterResponseModel?> register(RegisterRequestModel request);

}
