import 'dart:async';

import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/domain/repositories/task/task_service_repo.dart';

import '../../../base/domain/usecase.dart';

class DeleteTaskListUseCase extends UseCase<dynamic, String> {
  final repository = TaskRepository();

  @override
  Future<Stream<dynamic>> buildUseCaseStream(String? param) async {
    final StreamController<dynamic> controller = StreamController();

    repository
        .deleteTask(param!)
        .then((value) => controller.add(value))
        .catchError((e) => controller.addError(e));

    return controller.stream;
  }
}
