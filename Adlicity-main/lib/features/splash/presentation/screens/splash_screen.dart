import 'dart:async';
import 'package:adlicity/config/routes/app_routes.dart';
import 'package:adlicity/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 2500), () {
      // Navigate to the home screen after 2.5 seconds
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    });

    return Scaffold(
      backgroundColor:
          Colors.transparent, 
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.secondary,
              AppColors.primary
            ], 
          ),
        ),
        child: Center(
            child: Image.asset(
          'assets/images/logo_transparent_white.png',
          width: 120,
          height: 120,
        )),
      ),
    );
  }
}
