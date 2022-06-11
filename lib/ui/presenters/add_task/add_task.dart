import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/config/constans.dart';
import 'package:task_manager/ui/presenters/add_task/add_task_cubit.dart';
import 'package:task_manager/ui/presenters/add_task/add_task_state.dart';
import 'package:task_manager/ui/presenters/widgets/input_box.dart';
import 'package:task_manager/ui/theme/theme.dart';

import '../../touter/router.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({
    Key? key,
  }) : super(key: key);

  // final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<AddTaskCubit>(
          create: (_) => AddTaskCubit(AddTaskState()),
          child: BlocConsumer<AddTaskCubit, AddTaskState>(
            listener: (context, state) {
              if (state.requestStatus == AsyncRequestStatus.error) {
                showSnackBar(
                  context,
                  true,
                  'Error',
                );
              }else if(state.requestStatus == AsyncRequestStatus.success){
                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.TASK_LIST,
                );
              }
            },
            builder: (context, state) => Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
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
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const Text(
                            'Add Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: InputBox(
                        context: context,
                        title: 'Description',
                        hintText: '',
                        initialValue: '',
                        // controller: _usernameController,
                        onChange: (value) {
                          print(value);
                          if (value.isNotEmpty) {
                            context.read<AddTaskCubit>().setDescription(value);
                          } else {
                            context.read<AddTaskCubit>().setDescription('');
                          }
                        },
                      ),
                    ),
                  ],
                ),
                _btn(context, state),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btn(BuildContext context, AddTaskState state) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        width: double.infinity,
        height: 48.h,
        child: ElevatedButton(
          onPressed: () {
            if (state.description!.isNotEmpty) {
              context.read<AddTaskCubit>().addTask();
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: state.description!.isNotEmpty ? Colors.blue : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: state.requestStatus == AsyncRequestStatus.submitting
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                )
              : Text(
                  'Confirm',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
