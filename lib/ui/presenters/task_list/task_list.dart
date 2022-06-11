import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/config/constans.dart';
import 'package:task_manager/ui/presenters/task_list/task_list_cubit.dart';
import 'package:task_manager/ui/presenters/task_list/task_list_state.dart';
import 'package:task_manager/ui/theme/theme.dart';
import 'package:task_manager/ui/touter/router.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.ADD_TASK,
          );
        },
        foregroundColor: Colors.blue,
        backgroundColor: Colors.blue,
        label: const Text(
          'Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider<TaskListCubit>(
          create: (_) => TaskListCubit(TaskListState())..getTasks(),
          child: BlocConsumer<TaskListCubit, TaskListState>(
            listener: (context, state) {
              if (state.requestStatus == AsyncRequestStatus.error ||
                  state.requestStatusDelete == AsyncRequestStatus.error) {
                showSnackBar(
                  context,
                  true,
                  'Error',
                );
              }
            },
            builder: (context, state) => state.requestStatus ==
                        AsyncRequestStatus.submitting ||
                    state.requestStatusDelete == AsyncRequestStatus.submitting
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.black,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 20.h,
                        ),
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                          boxShadow: [buttonBoxShadow()],
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Number of tasks',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              state.taskList!.count!.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                          itemBuilder: (context, index) {
                            return _taskCard(context, state, index);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20.h,
                            );
                          },
                          itemCount: state.taskList!.data!.length,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Container _taskCard(BuildContext context, TaskListState state, int index) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        boxShadow: [buttonBoxShadow()],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Completed',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black26),
              ),
              Text(
                state.taskList!.data![index].completed.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Description',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black26),
              ),
              Text(
                state.taskList!.data![index].description.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Created at',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black26),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    state.taskList!.data![index].createdAt!
                        .split('T')[0]
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    state.taskList!.data![index].createdAt!
                        .split('T')[1]
                        .substring(0, 8)
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Updated at',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black26),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    state.taskList!.data![index].updatedAt!
                        .split('T')[0]
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    state.taskList!.data![index].updatedAt!
                        .split('T')[1]
                        .substring(0, 8)
                        .toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Edit',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<TaskListCubit>()
                          .deleteTask(state.taskList!.data![index].id!);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
