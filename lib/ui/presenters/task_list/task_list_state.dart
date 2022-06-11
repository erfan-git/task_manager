
import 'package:task_manager/base/enums/request_status.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_manager/domain/models/models.dart';

part 'task_list_state.freezed.dart';

@freezed
class TaskListState with _$TaskListState {
  factory TaskListState({
    @Default(AsyncRequestStatus.initial) AsyncRequestStatus? requestStatus,
    @Default(AsyncRequestStatus.initial) AsyncRequestStatus? requestStatusDelete,
    TaskList? taskList,
  }) = _TaskListState;
}