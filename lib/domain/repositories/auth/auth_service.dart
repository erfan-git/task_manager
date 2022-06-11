import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:task_manager/config/constans.dart';
import 'package:task_manager/domain/models/models.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: '${BASE_URL}user/')
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST("login")
  Future<LoginResponse> login(@Body() LoginRequest request);
}
