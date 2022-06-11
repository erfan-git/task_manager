
import 'package:task_manager/base/enums/request_status.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/models/models.dart';

part 'add_task_state.freezed.dart';

@freezed
class AddTaskState with _$AddTaskState {
  factory AddTaskState({
    @Default(AsyncRequestStatus.initial) AsyncRequestStatus? requestStatus,
    @Default('') String? description,
  }) = _AddTaskState;
}