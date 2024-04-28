import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/appbar_circle_button.dart';
import 'package:adlicity/features/main_layout/presentation/cubit/main_layout_cubit.dart';
import 'package:adlicity/features/main_layout/presentation/screens/main_screen.dart';
import 'package:adlicity/features/main_layout/presentation/screens/menu_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../core/utils/assets_manager.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: GestureDetector(
            onTap: () {
              if (zoomDrawerController.isOpen!()) {
                zoomDrawerController.close!();
              }
            },
            child: ZoomDrawer(
              controller: zoomDrawerController,
              style: DrawerStyle.defaultStyle,
              menuScreen: MenuScreen(),
              mainScreen: MainScreen(),
              borderRadius: 24.0,
              showShadow: true,
              angle: -12.0,
              drawerShadowsBackgroundColor: Colors.grey[300]!,
              slideWidth: MediaQuery.of(context).size.width * .65,
              // mainScreenScale: 0.15,
              // slideHeight: context.height * 0.05,
              openCurve: Curves.fastOutSlowIn,
              closeCurve: Curves.easeIn,
            ),
          ),
        );
      },
    );
  }
}
