import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/local/shared_pref.dart';
import 'package:task_manager/domain/usecases/auth/login_usecase.dart';
import 'package:task_manager/domain/usecases/task/delete_task_usecase.dart';
import 'package:task_manager/domain/usecases/task/gat_task_list_usecase.dart';
import 'package:task_manager/ui/presenters/task_list/task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit(TaskListState initialState) : super(initialState);

  final _getTaskListUseCase = GetTaskListUseCase();
  final _deleteTaskUseCase = DeleteTaskListUseCase();

  void getTasks() {
    emit(
      state.copyWith(
        requestStatus: AsyncRequestStatus.submitting,
      ),
    );
    _getTaskListUseCase.execute(
      (event) {
        emit(state.copyWith(
          requestStatus: AsyncRequestStatus.success,
          taskList: event,
        ));
      },
      (e) {
        print(e);
        emit(state.copyWith(requestStatus: AsyncRequestStatus.error));
      },
    );
  }

  void deleteTask(String id) {
    emit(
      state.copyWith(
        requestStatusDelete: AsyncRequestStatus.submitting,
      ),
    );
    _deleteTaskUseCase.execute(
      (event) {
        getTasks();
        emit(state.copyWith(
          requestStatusDelete: AsyncRequestStatus.success,
        ));
      },
      (e) {
        print(e);
        emit(state.copyWith(requestStatusDelete: AsyncRequestStatus.error));
      },
      params: id,
    );
  }
}
