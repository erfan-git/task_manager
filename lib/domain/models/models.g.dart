// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      v: json['__v'] as int?,
      age: json['age'] as int?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '__v': instance.v,
      'age': instance.age,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'email': instance.email,
      'name': instance.name,
    };

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

_$_LoginRequest _$$_LoginRequestFromJson(Map<String, dynamic> json) =>
    _$_LoginRequest(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_TaskList _$$_TaskListFromJson(Map<String, dynamic> json) => _$_TaskList(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskListToJson(_$_TaskList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };

_$_AddTask _$$_AddTaskFromJson(Map<String, dynamic> json) => _$_AddTask(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Task.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddTaskToJson(_$_AddTask instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      v: json['__v'] as int?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      owner: json['owner'] as String?,
      description: json['description'] as String?,
      completed: json['completed'] as bool?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      '__v': instance.v,
      '_id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'owner': instance.owner,
      'description': instance.description,
      'completed': instance.completed,
    };

_$_Description _$$_DescriptionFromJson(Map<String, dynamic> json) =>
    _$_Description(
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_DescriptionToJson(_$_Description instance) =>
    <String, dynamic>{
      'description': instance.description,
    };

_$_Completed _$$_CompletedFromJson(Map<String, dynamic> json) => _$_Completed(
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_CompletedToJson(_$_Completed instance) =>
    <String, dynamic>{
      'description': instance.description,
    };
