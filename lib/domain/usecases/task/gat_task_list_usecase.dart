import 'dart:async';

import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/task/task_service_repo.dart';

import '../../../base/domain/usecase.dart';

class GetTaskListUseCase extends UseCase<TaskList, dynamic> {
  final repository = TaskRepository();

  @override
  Future<Stream<TaskList>> buildUseCaseStream(dynamic) async {
    final StreamController<TaskList> controller = StreamController();

    repository
        .taskList()
        .then((value) => controller.add(value))
        .catchError((e) => controller.addError(e));

    return controller.stream;
  }
}
