import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/profile_item.dart';
import 'profile_info_section.dart';
import 'profile_portfolio_section.dart';
import 'profile_statistics_section.dart';

// ignore: must_be_immutable
class ProfileBody extends StatefulWidget {
  ProfileBody(
      {super.key,
      required this.isScrolling,
      required this.scrollController,
      required this.tabController,
      required this.profileImage,
      required this.profileInfo,
      required this.tiktokFollowers,
      required this.facebookFollowers,
      required this.twitterFollowers,
      required this.youTubeFollowers,
      required this.instagramFollowers,
      required this.profileName,
      required this.profileRate});

  bool isScrolling;
  TabController tabController;
  ScrollController scrollController;

  final String profileImage;
  final String profileInfo;
  final String tiktokFollowers;
  final String facebookFollowers;
  final String twitterFollowers;
  final String youTubeFollowers;
  final String instagramFollowers;
  final String profileName;
  final double profileRate;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onVerticalDragEnd: (details) {
            // Check the direction of the swipe
            if (details.velocity.pixelsPerSecond.dy > 0 && widget.isScrolling) {
              // Swipe Down
              print('Swiped Down');
              setState(() {
                widget.isScrolling = false;
              });
            }
          },
          child: ProfileItem(
            profileImage: widget.profileImage,
            width: context.width,
            height: widget.isScrolling
                ? context.height * 0.15
                : context.height * 0.45,
            tiktokFollowers: widget.tiktokFollowers,
            facebookFollowers:widget.facebookFollowers,
            twitterFollowers: widget.twitterFollowers,
            youTubeFollowers: widget.youTubeFollowers,
            instagramFollowers: widget.instagramFollowers,
            profileName: widget.profileName,
            profileInfo: widget.profileInfo,
            profileRate: widget.profileRate,
            bottomLeftRadius: 0,
            bottomRightRadius: 0,
            topLeftRadius: 0,
            topRightRadius: 0,
            isMyProfile: true,
          ),
        ),
        TabBar(
          indicatorColor: AppColors.primary,
          labelStyle: TextStyle(
              color: AppColors.primary,
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(
              color: AppColors.textColor,
              fontFamily: AppStrings.fontFamily,
              fontWeight: FontWeight.w600),
          controller: widget.tabController,
          tabs: [
            Tab(text: 'info'.tr()),
            Tab(text: 'statistics'.tr()),
            Tab(text: 'portfolio'.tr()),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController,
            children: [
              // Contents of Tab 1
              ProfileInfoSection(scrollController: widget.scrollController),

              // Contents of Tab 2
              ProfileStatisticsSection(
                  scrollController: widget.scrollController),

              // Contents of Tab 3
              ProfilePortfolioSection(
                scrollController: widget.scrollController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
