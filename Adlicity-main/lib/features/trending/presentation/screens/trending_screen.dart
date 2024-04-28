import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/widgets/profile_item.dart';
import 'package:adlicity/features/trending/presentation/cubit/trending_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/category_button.dart';

// ignore: must_be_immutable
class TrendingScreen extends StatelessWidget {
  TrendingScreen({super.key});

  List<String> usersImagesTest = [
    ImagesAssets.preson1,
    ImagesAssets.preson2,
    ImagesAssets.preson3,
    ImagesAssets.preson4,
    ImagesAssets.preson1,
    ImagesAssets.preson2,
    ImagesAssets.preson3,
    ImagesAssets.preson4,
    ImagesAssets.preson1,
    ImagesAssets.preson2,
    ImagesAssets.preson3,
    ImagesAssets.preson4,
    ImagesAssets.preson1,
    ImagesAssets.preson2,
    ImagesAssets.preson3,
    ImagesAssets.preson4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            IconsAssets.arrowLeft,
            width: 25,
          ),
        ),
        title: Text('trending'.tr()),
      ),
      body: BlocBuilder<TrendingCubit, TrendingState>(
        builder: (context, state) {
          TrendingCubit cubit = BlocProvider.of(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CategoryButton(
                      categoryName: cubit.categories[index],
                      onTap: () {
                        cubit.changeCategory(cubit.categories[index]);
                      },
                      selectedCategory: cubit.selectedCategory,
                    ),
                    itemCount: cubit.categories.length,
                  ),
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: usersImagesTest.length,
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
                    profileImage: usersImagesTest[index],
                    profileInfo: 'Tech Influncer From Egypt',
                    profileName: 'Sherif Mahmoud',
                    profileRate: 4.6,
                  ),
                  padding: EdgeInsets.all(Constants.kPadding),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
