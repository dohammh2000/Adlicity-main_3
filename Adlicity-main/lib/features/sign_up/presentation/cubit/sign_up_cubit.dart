import 'package:adlicity/core/utils/app_strings.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final signUpFormKey = GlobalKey<FormState>();
  String accountType = AppStrings.influencer;
  bool showPassword = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void changeAccountType(String type) {
    accountType = type;
    emit(SignUpChangeAccountType(accountType: accountType));
  }

  void toggleShowPassword(value) {
    showPassword = value;
    emit(SignUpToggleShowPassword(showPassword));
  }
}
