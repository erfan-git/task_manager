import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/usecases/task/add_task_usecase.dart';
import 'package:task_manager/ui/presenters/add_task/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(AddTaskState initialState) : super(initialState);

  final _addTaskListUseCase = AddTaskListUseCase();

  void setDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void addTask() {
    emit(
      state.copyWith(
        requestStatus: AsyncRequestStatus.submitting,
      ),
    );
    _addTaskListUseCase.execute(
      (event) {
        emit(state.copyWith(
          requestStatus: AsyncRequestStatus.success,
        ));
      },
      (e) {
        print(e);
        emit(state.copyWith(requestStatus: AsyncRequestStatus.error));
      },
      params: Description(description: state.description),
    );
  }
}
