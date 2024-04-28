import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/profile_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/main_button.dart';
import '../cubit/add_campgain_cubit.dart';

class GoalStep extends StatelessWidget {
  const GoalStep({
    super.key,
    required this.cubit,
  });

  final AddCampgainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cubit.activeStep == 2,
      child: Column(
        children: [
          Image.asset(
            ImagesAssets.goalAva,
            width: context.width * 0.7,
          ),
          SizedBox(
            height: 20,
          ),
          InputField(
            controller: TextEditingController(),
            hintText: 'budget',
            maxLines: 1,
            prefixIcon: Icon(
              Icons.attach_money,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'goal'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: Constants.adGoals.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile.adaptive(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.primary,
                  title: Text(
                    Constants.adGoals[index].tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: AppStrings.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  value: Constants.adGoals[index],
                  groupValue: cubit.adGoal,
                  onChanged: (value) {
                    cubit.changeAdGoal(value!);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'publish_on'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 160,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: Constants.platforms.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 50,
              ),
              itemBuilder: (BuildContext context, int index) {
                final platform = Constants.platforms[index]; // Get the adType
                final isChecked = cubit.chosenPlatform.containsKey(platform)
                    ? cubit.chosenPlatform[platform]
                    : false; // Check if the key exists
                return CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.all(0),
                  value: isChecked,
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    platform.tr(),
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: AppStrings.fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  activeColor: AppColors.primary,
                  side: BorderSide(color: AppColors.primary),
                  onChanged: (bool? value) {
                    cubit.togglePlatform(
                        index: index,
                        value: value ??
                            false); // Pass the value or default to false
                    print(cubit.chosenPlatform[Constants.platforms[index]]);
                  },
                );
              },
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'choose_publisher'.tr(),
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              itemCount: Constants.publishersChoiceTypes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, int index) {
                return RadioListTile.adaptive(
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppColors.primary,
                  title: Text(
                    Constants.publishersChoiceTypes[index].tr(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontFamily: AppStrings.fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  value: Constants.publishersChoiceTypes[index],
                  groupValue: cubit.publishersChoiceType,
                  onChanged: (value) {
                    cubit.changePublishersChoiceType(value!);
                  },
                );
              },
            ),
          ),
          Visibility(
            visible: Constants.publishersChoiceTypes[2].toLowerCase() ==
                cubit.publishersChoiceType.toLowerCase(),
            child: Column(
              children: [
                InputField(
                  controller: cubit.searchController,
                  hintText: 'search',
                  maxLines: 1,
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary,
                  ),
                  onChanged: (value) {
                    cubit.updateSearch(value);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: cubit.searchController.text.length > 0,
                  child: Container(
                    height: 250,
                    width: context.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary,
                      ),
                      borderRadius:
                          BorderRadius.circular(Constants.kRoundedCorner),
                    ),
                    child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage(ImagesAssets.preson1),
                              ),
                              title: Text(
                                'Sherif Mahmoud',
                              ),
                              titleTextStyle: TextStyle(
                                  color: AppColors.primary,
                                  fontFamily: AppStrings.fontFamily,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                              subtitle: Text('Publisher form Egypt'),
                              subtitleTextStyle: TextStyle(
                                color: AppColors.textColor,
                                fontFamily: AppStrings.fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            Divider(color: AppColors.primary),
                        itemCount: 10),
                  ).animate().fadeIn(duration: Duration(milliseconds: 500)),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'chosen_publishers'.tr(),
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
                  height: 220,
                  child: ListView.separated(
                    padding:
                        EdgeInsetsDirectional.only(start: Constants.kPadding),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ProfileItem(
                      facebookFollowers: '1.4M',
                      instagramFollowers: '192.3K',
                      tiktokFollowers: '2.3M',
                      twitterFollowers: '132.9K',
                      youTubeFollowers: '23.5K',
                      profileImage: Constants.usersImagesTest[index],
                      profileInfo: 'Tech Influncer From Egypt',
                      profileName: 'Sherif Mahmoud',
                      profileRate: 4.6,
                    ),
                    itemCount: Constants.usersImagesTest.length,
                    separatorBuilder: (context, index) => SizedBox(width: 15),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ).animate().fadeIn(duration: Duration(milliseconds: 1000)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainButton(
                  width: context.width / 2.4,
                  backgroundColors: [AppColors.third, AppColors.third],
                  titleColor: AppColors.primary,
                  onPressed: () {
                    cubit.updateActiveStep(cubit.activeStep - 1);
                  },
                  title: 'back'),
              MainButton(
                  width: context.width / 2.4,
                  onPressed: () {
                    cubit.updateActiveStep(cubit.activeStep + 1);
                  },
                  title: 'confirm'),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ).animate().fade(duration: Duration(milliseconds: 500)),
    );
  }
}
