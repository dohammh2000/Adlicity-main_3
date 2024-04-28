
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/category_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/add_campgain_cubit.dart';

class InfoStep extends StatelessWidget {
  const InfoStep({
    super.key,
    required this.cubit,
  });

  final AddCampgainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cubit.activeStep == 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesAssets.infoCampaign,
            width: context.width * 0.7,
          ),
          InputField(
            controller: TextEditingController(),
            hintText: 'title',
            maxLines: 1,
            prefixIcon: Icon(
              Icons.title,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InputField(
            controller: TextEditingController(),
            hintText: 'description',
            maxLines: 1,
            prefixIcon: Icon(
              Icons.description,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'offering_stage'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.width * 0.42,
                child: InputField(
                  controller: TextEditingController(),
                  hintText: 'start',
                  maxLines: 1,
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(
                width: context.width * 0.42,
                child: InputField(
                  controller: TextEditingController(),
                  hintText: 'end',
                  maxLines: 1,
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InputField(
            controller: TextEditingController(),
            hintText: 'deadline',
            maxLines: 1,
            prefixIcon: Icon(
              Icons.date_range,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'category'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryButton(
                categoryName: Constants.categories[index],
                onTap: () {
                  cubit.changeCategory(Constants.categories[index]);
                },
                selectedCategory: cubit.selectedCategory,
              ),
              itemCount: Constants.categories.length,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MainButton(onPressed: () {
            cubit.updateActiveStep(1);
          }, title: 'next'),
          SizedBox(
            height: 40,
          ),
        ],
      ).animate().fade(duration: Duration(milliseconds: 500)),
    );
  }
}
