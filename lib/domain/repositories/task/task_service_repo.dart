import 'package:task_manager/domain/models/models.dart';
import 'package:dio/dio.dart';
import 'package:task_manager/domain/repositories/local/shared_pref.dart';

import 'task_service.dart';

class TaskRepository {
  final service = TaskService(Dio());

  Future<TaskService> serviceWithToken() async {
    final st = LocalStorage();
    final token = await st.getToken();

    print('token ==>');
    print(token);

    return TaskService(
      Dio(
        BaseOptions(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      ),
    );
  }

  Future<TaskList> taskList() async {
    final ser = await serviceWithToken();
    return await ser.taskList();
  }

  Future<AddTask> addTask(Description description) async {
    final ser = await serviceWithToken();
    return await ser.addTask(description);
  }

  Future<AddTask> updateTask(Completed completed) async {
    final ser = await serviceWithToken();
    return await ser.updateTask(completed, 'id');
  }

  Future<dynamic> deleteTask(String id) async {
    final ser = await serviceWithToken();
    return await ser.deleteTask(id);
  }
}
