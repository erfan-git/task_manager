import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/local/shared_pref.dart';
import 'package:task_manager/domain/usecases/auth/login_usecase.dart';
import 'package:task_manager/ui/presenters/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginState initialState) : super(initialState);

  final LocalStorage _localStorage = LocalStorage();

  final _loginUseCase = LoginUseCase();

  void usernameValidated(bool isValid) {
    emit(state.copyWith(isUsernameValid: isValid));
  }

  void passwordValidated(bool isValid) {
    emit(state.copyWith(isPasswordValid: isValid));
  }

  void login(LoginRequest request) {
    emit(
      state.copyWith(
        requestStatus: AsyncRequestStatus.submitting,
      ),
    );
    print('enter');

    _loginUseCase.execute(
      (event) async{
        print('event.user!.id ==>');
        print(event.user!.id);await _localStorage.saveToken(event.token!);
        emit(state.copyWith(requestStatus: AsyncRequestStatus.success));
      },
      (e) {
        print(e);
        emit(state.copyWith(requestStatus: AsyncRequestStatus.error));
      },
      params: request,
    );
  }
}
