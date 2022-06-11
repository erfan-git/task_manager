// import 'package:equatable/equatable.dart';
import 'package:task_manager/base/enums/request_status.dart';
//
// class GetPhoneState extends Equatable {
//   final AsyncRequestStatus? getOtpStatus;
//   final String? phone;
//   final bool isPhoneValid;
//   final String? requestId;
//
//   GetPhoneState(
//       {this.getOtpStatus,
//       this.phone,
//       this.isPhoneValid = false,
//       this.requestId});
//
//   factory GetPhoneState.initial() {
//     return GetPhoneState(
//         getOtpStatus: AsyncRequestStatus.initial,
//         phone: '',
//         isPhoneValid: false);
//   }
//
//   GetPhoneState copyWith(
//       {AsyncRequestStatus? getOtpStatus,
//       String? phone,
//       bool? isPhoneValid,
//       String? requestId}) {
//     return GetPhoneState(
//         getOtpStatus: getOtpStatus ?? this.getOtpStatus,
//         phone: phone ?? this.phone,
//         isPhoneValid: isPhoneValid ?? this.isPhoneValid,
//         requestId: requestId ?? this.requestId);
//   }
//
//   @override
//   List<Object?> get props => [
//         getOtpStatus,
//         phone,
//         isPhoneValid,
//       ];
// }


import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
// part 'login_state.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(AsyncRequestStatus.initial) AsyncRequestStatus? requestStatus,
    @Default(false) bool? isUsernameValid,
    @Default(false) bool? isPasswordValid,
    // PhotoList? photoList,
    // List<Photo>? photos,
  }) = _LoginState;
}