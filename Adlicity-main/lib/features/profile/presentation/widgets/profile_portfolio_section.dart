import 'package:adlicity/core/widgets/campaign_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';

class ProfilePortfolioSection extends StatelessWidget {
  const ProfilePortfolioSection({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Padding(
        padding: EdgeInsets.all(Constants.kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'last_campaigns'.tr(),
              style: TextStyle(
                color: AppColors.primary,
                fontFamily: AppStrings.fontFamily,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true, 
              physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => CampaignItem(
                      title: 'Title',
                      price: 1220,
                      description: AppStrings.dumyText,
                      profileImages: Constants.testUsersImages,
                      status: 'done',
                      category: 'fashion',
                      dateFrom: '20/9/2023',
                      dateTo: '25/9/2023',
                      adTypes: {
                        'story',
                        'post',
                        'inVideo',
                        'fullVideo',
                        'reel'
                      },
                      profileNames: List.generate(
                          Constants.testUsersImages.length,
                          (index) => 'Sherif Mahmoud'),
                          isPadding: false,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: Constants.testUsersImages.length),
          ],
        ),
      ),
    );
  }
}
