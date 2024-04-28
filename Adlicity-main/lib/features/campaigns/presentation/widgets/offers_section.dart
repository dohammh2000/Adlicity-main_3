import 'package:adlicity/config/routes/app_routes.dart';
import 'package:adlicity/core/utils/functions/get_campaign_status.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/campaign_info_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/campaign_item.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) => CampaignItem(
        title: 'Title',
        price: 1220,
        description: AppStrings.dumyText,
        profileImages: Constants.testUsersImages,
        status: 'offering',
        category: 'fashion',
        dateFrom: '20/9/2023',
        dateTo: '25/9/2023',
        adTypes: {'story', 'post', 'inVideo', 'fullVideo', 'reel'},
        profileNames: List.generate(
            Constants.testUsersImages.length, (index) => 'Sherif Mahmoud'),
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.campaignDetailsRoute,
            arguments: {
              'status': 'offering',
              'date': '25/9/2023',
              'title': 'Title',
              'description': AppStrings.dumyText,
              'category': 'fashion',
              'adTypes': {'story', 'post', 'inVideo', 'fullVideo', 'reel'},
              'price': 1220.toDouble(),
              'link': 'https://adlicity.net/campaigns/Xnsfjn/',
            },
          );
        },
      ),
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemCount: 10,
    );
  }
}
