import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/campaign_item.dart';

class MyCampaignsSection extends StatelessWidget {
  const MyCampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20),
      itemBuilder: (context, index) => CampaignItem(
        title: 'Title',
        price: 1220,
        description: AppStrings.dumyText,
        profileImages: Constants.testUsersImages,
        status: 'done',
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
              'status': 'done',
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
