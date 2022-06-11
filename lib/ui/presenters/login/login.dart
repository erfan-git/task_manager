import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/base/enums/request_status.dart';
import 'package:task_manager/config/constans.dart';
import 'package:task_manager/domain/models/models.dart';
import 'package:task_manager/ui/presenters/login/login_cubit.dart';
import 'package:task_manager/ui/presenters/login/login_state.dart';
import 'package:task_manager/ui/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task_manager/ui/touter/router.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(LoginState()),
          child: Stack(
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Center(
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _emailTextField(context),
                                SizedBox(
                                  height: 20.h,
                                ),
                                _passwordTextField(context),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _btn(context),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _emailTextField(BuildContext context) {
    return TextFormField(
      focusNode: usernameFocusNode,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return null;
        }

        if (!validateMyInput(value!)) {
          context.read<LoginCubit>().usernameValidated(false);
          return 'Enter correct format';

          // return AppLocalizations.of(context)!
          //     .phoneNumberValidate;
        } else {
          context.read<LoginCubit>().usernameValidated(true);

          return null;
        }
      },
      autovalidateMode: AutovalidateMode.always,
      controller: _usernameController,
      autocorrect: true,
      showCursor: false,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      // maxLength: 11,
      // maxLengthEnforcement:
      //     MaxLengthEnforcement.enforced,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 16.w,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        counterStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 10.sp),
        counterText: '',
        labelText: 'Username',
        labelStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: outLineInputBorder(),
        border: outLineInputBorder(),
        focusedBorder: outLineInputBorder(focused: true),
      ),
    );
  }

  TextFormField _passwordTextField(BuildContext context) {
    return TextFormField(
      focusNode: passwordFocusNode,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return null;
        } else {
          context.read<LoginCubit>().passwordValidated(true);

          return null;
        }
      },
      autovalidateMode: AutovalidateMode.always,
      controller: _passwordController,
      autocorrect: true,
      showCursor: false,
      autofocus: false,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodyText1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 16.w,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        counterStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 10.sp),
        counterText: '',
        labelText: 'Password',
        labelStyle: Theme.of(context).textTheme.bodyText1,
        enabledBorder: outLineInputBorder(),
        border: outLineInputBorder(),
        focusedBorder: outLineInputBorder(focused: true),
      ),
    );
  }

  Widget _btn(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.requestStatus == AsyncRequestStatus.success) {
            Navigator.of(context).pushReplacementNamed(
              AppRoutes.TASK_LIST,
            );
          } else if (state.requestStatus == AsyncRequestStatus.error) {
            showSnackBar(
              context,
              true,
              'Error',
            );
          }
        },
        builder: (context, state) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: () {
              if (state.isPasswordValid! && state.isUsernameValid!) {
                print(_usernameController.text);
                print(_passwordController.text);
                context.read<LoginCubit>().login(
                      LoginRequest(
                        email: _usernameController.text,
                        password: _passwordController.text,
                      ),
                    );
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: state.isPasswordValid! && state.isUsernameValid!
                  ? Colors.blue
                  : Colors.grey,
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
                    'Login',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}

bool validateMyInput(String value) {
  return RegExp(r'\S+@\S+\.\S+').hasMatch(value);
}
