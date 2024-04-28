import 'package:adlicity/config/routes/app_routes.dart';
import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/features/main_layout/presentation/cubit/main_layout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer_button_custom.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayoutCubit, MainLayoutState>(
      builder: (context, state) {
        MainLayoutCubit cubit = BlocProvider.of(context);
        return Container(
          color: AppColors.primary,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: Constants.kPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.13,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      ImagesAssets.preson3,
                    ),
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sherif Mahmoud',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppStrings.fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: context.height * 0.13,
                  ),
                  // DrawerButtonCustom(
                  //   icon: IconsAssets.profileWhite,
                  //   text: 'profile',
                  //   onTap: () {},
                  // ),
                  // DrawerButtonCustom(
                  //   icon: IconsAssets.walletWhite,
                  //   text: 'wallet',
                  //   onTap: () {},
                  // ),
                  // DrawerButtonCustom(
                  //   icon: IconsAssets.notificationsWhite,
                  //   text: 'notifications',
                  //   onTap: () {},
                  // ),
                  // DrawerButtonCustom(
                  //   icon: IconsAssets.campaignWhite,
                  //   text: 'campaigns',
                  //   onTap: () {},
                  // ),
                  DrawerButtonCustom(
                    icon: IconsAssets.customerServiceWhite,
                    text: 'customer_service',
                    onTap: () {
                      showCustomerServiceBottomSheet(context);
                    },
                  ),
                  DrawerButtonCustom(
                    icon: IconsAssets.settingWhite,
                    text: 'settings',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.settingsRoute);
                    },
                  ),
                  DrawerButtonCustom(
                    icon: IconsAssets.infoWhite,
                    text: 'faq',
                    onTap: () {
                      Navigator.pushNamed(context, Routes.faqRoute);
                    },
                  ),
                  SizedBox(
                    height: context.height * 0.13,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: context.width * 0.25,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        'logout'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: AppStrings.fontFamily,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showCustomerServiceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: context.width,
          child: Column(
            children: [
              Text(
                'customer_service'.tr(),
                style: TextStyle(
                  color: AppColors.primary,
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'contact_us'.tr(),
                style: TextStyle(
                  color: AppColors.textColor,
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 160,
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconsAssets.whatsapp,
                            width: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'whatsapp'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppStrings.fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 160,
                      width: context.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconsAssets.telegram,
                            width: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'telegram'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppStrings.fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
