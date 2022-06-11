import 'dart:async';

import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/auth/auth_service_repo.dart';

import '../../../base/domain/usecase.dart';

class LoginUseCase extends UseCase<LoginResponse, LoginRequest> {
  final repository = AuthRepository();

  @override
  Future<Stream<LoginResponse>> buildUseCaseStream(LoginRequest? params) async {
    final StreamController<LoginResponse> controller = StreamController();

    repository
        .login(params!)
        .then((value) => controller.add(value))
        .catchError((e) => controller.addError(e));

    return controller.stream;
  }
}
