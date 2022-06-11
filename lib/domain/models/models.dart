import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

part 'models.g.dart';

@freezed
class User with _$User {
  factory User({
    @JsonKey(name: '__v') int? v,
    int? age,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
    String? email,
    String? name,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    String? token,
    User? user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  factory LoginRequest({
    String? email,
    String? password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class TaskList with _$TaskList {
  factory TaskList({
    int? count,
    List<Task>? data,
  }) = _TaskList;

  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);
}

@freezed
class AddTask with _$AddTask {
  factory AddTask({
    bool? success,
    Task? data,
  }) = _AddTask;

  factory AddTask.fromJson(Map<String, dynamic> json) =>
      _$AddTaskFromJson(json);
}

@freezed
class Task with _$Task {
  factory Task({
    @JsonKey(name: '__v') int? v,
    @JsonKey(name: '_id') String? id,
    String? createdAt,
    String? updatedAt,
    String? owner,
    String? description,
    bool? completed,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

@freezed
class Description with _$Description {
  factory Description({
    String? description,
  }) = _Description;

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);
}

@freezed
class Completed with _$Completed {
  factory Completed({
    String? description,
  }) = _Completed;

  factory Completed.fromJson(Map<String, dynamic> json) =>
      _$CompletedFromJson(json);
}
