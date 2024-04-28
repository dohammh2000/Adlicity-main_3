import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/appbar_circle_button.dart';
import 'package:adlicity/features/home/presentation/cubit/home_cubit.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:blurhash_ffi/blurhash_the_image.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/ad_type_item.dart';
import '../../../../core/widgets/category_button.dart';
import '../../../../core/widgets/platform_followers_item.dart';
import '../../../../core/widgets/profile_item.dart';
import '../../../../core/widgets/proposal_full_info_item.dart';
import '../../../../core/widgets/proposal_full_item.dart';
import '../../../../core/widgets/proposal_info_item.dart';
import '../widgets/announcements_slider.dart';
import '../widgets/title_and_subtitle_section.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          HomeCubit cubit = BlocProvider.of(context);
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleAndSubtitleSection(
                    subtitle: 'welcome_back', title: 'hello', title2: 'Sherif'),
                SizedBox(
                  height: 20,
                ),
                AnnouncementsSlider(),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleAndSubtitleSection(
                        subtitle: 'influencers', title: 'trending'),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Colors.transparent; // No overlay color
                          },
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.trendingRoute);
                      },
                      child: Text(
                        'see_more'.tr(),
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: AppStrings.fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
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
                      profileImage:Constants. usersImagesTest[index],
                      profileInfo: 'Tech Influncer From Egypt',
                      profileName: 'Sherif Mahmoud',
                      profileRate: 4.6,
                    ),
                    itemCount: Constants.usersImagesTest.length,
                    separatorBuilder: (context, index) => SizedBox(width: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleAndSubtitleSection(
                        subtitle: 'campaigns', title: 'proposals'),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Colors.transparent; // No overlay color
                          },
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'see_more'.tr(),
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: AppStrings.fontFamily,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ListView.separated(
                  
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ProposalFullItem(
                      category: Constants.proposalsTest[index]['category'],
                      description: Constants.proposalsTest[index]['description'],
                      facebookFollowers: Constants.proposalsTest[index]
                          ['facebookFollowers'],
                      instagramFollowers: Constants.proposalsTest[index]
                          ['instagramFollowers'],
                      price: Constants.proposalsTest[index]['price'],
                      profileImage: Constants.proposalsTest[index]['profileImage'],
                      profileInfo: Constants.proposalsTest[index]['profileInfo'],
                      profileName: Constants.proposalsTest[index]['profileName'],
                      profileRate: Constants.proposalsTest[index]['profileRate'],
                      tiktokFollowers: Constants.proposalsTest[index]['tiktokFollowers'],
                      title: Constants.proposalsTest[index]['title'],
                      twitterFollowers: Constants.proposalsTest[index]['twitterFollowers'],
                      youTubeFollowers: Constants.proposalsTest[index]['youTubeFollowers'],
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: Constants.proposalsTest.length,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
