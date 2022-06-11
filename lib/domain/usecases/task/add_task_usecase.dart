import 'dart:async';

import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/task/task_service_repo.dart';

import '../../../base/domain/usecase.dart';

class AddTaskListUseCase extends UseCase<AddTask, Description> {
  final repository = TaskRepository();

  @override
  Future<Stream<AddTask>> buildUseCaseStream(Description? param) async {
    final StreamController<AddTask> controller = StreamController();

    repository
        .addTask(param!)
        .then((value) => controller.add(value))
        .catchError((e) => controller.addError(e));

    return controller.stream;
  }
}
