import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:task_manager/config/constans.dart';
import 'package:task_manager/domain/models/models.dart';

part 'task_service.g.dart';

@RestApi(baseUrl: '${BASE_URL}task')
abstract class TaskService {
  factory TaskService(Dio dio, {String baseUrl}) = _TaskService;

  @GET("")
  Future<TaskList> taskList();

  @POST("")
  Future<AddTask> addTask(@Body() Description params);

  @PUT("{id}")
  Future<AddTask> updateTask(
    @Body() Completed params,
    @Path() String id,
  );

  @DELETE("/{id}")
  Future<dynamic> deleteTask(@Path() String id);
}
