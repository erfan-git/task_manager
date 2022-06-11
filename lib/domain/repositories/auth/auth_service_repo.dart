import 'package:task_manager/domain/models/models.dart';

import 'auth_service.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final service = AuthService(Dio());

  Future<LoginResponse> login(LoginRequest request) async{
    return await service.login(request);
  }
}
