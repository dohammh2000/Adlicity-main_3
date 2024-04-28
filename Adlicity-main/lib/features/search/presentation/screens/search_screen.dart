import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/features/search/presentation/cubit/search_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/category_button.dart';
import '../../../../core/widgets/input_field.dart';
import '../../../../core/widgets/profile_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          SearchCubit cubit = BlocProvider.of(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(Constants.kPadding),
                  child: InputField(
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
                  ).animate().fade(duration: Duration(milliseconds: 1000)),
                ),
                Gap(5),
                SizedBox(
                  height: 22,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: Constants.kPadding),
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
                Gap(5),
                Visibility(
                  visible: cubit.searchController.text.length > 0,
                  child: GridView.builder(

                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Constants.usersImagesTest.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8, // Adjust the aspect ratio as needed
                      mainAxisSpacing: 10.0, // Add space between rows
                      crossAxisSpacing: 10.0, // Add space between columns
                    ),
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
                    ).animate().scale(duration: Duration(milliseconds: 500 * index)),
                    padding: EdgeInsets.all(Constants.kPadding),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset(
          IconsAssets.arrowLeft,
          width: 24,
        ),
      ),
      title: Text(
        'search'.tr(),
        style: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
