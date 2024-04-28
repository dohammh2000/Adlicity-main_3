import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

    final loginFormKey = GlobalKey<FormState>();
      final TextEditingController emailController = TextEditingController();
      final TextEditingController passwordController = TextEditingController();
      bool showPassword = false;


      void toggleShowPassword (value){
        showPassword = value;
        emit(LoginToggleShowPassword(showPassword));
      }


}
