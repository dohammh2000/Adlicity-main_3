import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/features/login/presentation/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/main_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: cubit.loginFormKey,
                child: Column(
                  children: [
                    _loginHeader(context),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Constants.kPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InputField(
                            controller: cubit.emailController,
                            isEmail: true,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                IconsAssets.email,
                                width: 1,
                              ),
                            ),
                            hintText: 'email',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InputField(
                            controller: cubit.passwordController,
                            obscureText: cubit.showPassword ? false : true,
                            maxLines: 1,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                IconsAssets.lock,
                                width: 1,
                              ),
                            ),
                            suffixIcon: GestureDetector( 
                              onTap: () {
                                cubit.toggleShowPassword(!cubit.showPassword);
                                
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  cubit.showPassword
                                      ? IconsAssets.eyeCrossed
                                      : IconsAssets.eye,
                                  width: 1,
                                ),
                              ),
                            ),
                            hintText: 'password',
                          ),
                          TextButton(
                            onPressed: () {},
                               
                                 

                            child: Text(
                              'forgot_password'.tr(),
                              style: TextStyle(
                                  fontFamily: AppStrings.fontFamily,
                                  fontSize: 12,
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.transparent),
                            ),
                          ),
                          MainButton(
                            onPressed: () {
                                   Navigator.pushReplacementNamed(context, Routes.homeRoute);
                            },
                            title: 'login',
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                              Navigator.pushNamed(context, Routes.signUpRoute);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'dont_have_acc'.tr(),
                          style: TextStyle(
                              fontFamily: AppStrings.fontFamily,
                              fontSize: 12,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'sign_up'.tr(),
                              style: TextStyle(
                                  fontFamily: AppStrings.fontFamily,
                                  fontSize: 12,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.transparent),
                      ),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Image.asset(
                          ImagesAssets.logoLeft,
                          height: context.height * 0.305,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Row _loginHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          ImagesAssets.logoRight,
          height: context.height * 0.305,
        ),
        SizedBox(
          width: context.width * 0.17,
        ),
        Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'login'.tr(),
              style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 50),
            ),
            Text(
              'login_subtitle'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontFamily: AppStrings.fontFamily,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
