import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../utils/assets_manager.dart';
import '../utils/constants.dart';
import 'profile_item.dart';
import 'proposal_full_info_item.dart';

class ProposalFullItem extends StatelessWidget {
  final String facebookFollowers;
  final String instagramFollowers;
  final String tiktokFollowers;
  final String twitterFollowers;
  final String youTubeFollowers;
  final String profileImage;
  final String profileInfo;
  final String profileName;
  final double profileRate;
  final String category;
  final String description;
  final String title;
  final String price;

  const ProposalFullItem({
    super.key,
    required this.facebookFollowers,
    required this.instagramFollowers,
    required this.tiktokFollowers,
    required this.twitterFollowers,
    required this.youTubeFollowers,
    required this.profileImage,
    required this.profileInfo,
    required this.profileName,
    required this.profileRate,
    required this.category,
    required this.description,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.kPadding),
      child: Container(
        width: context.width,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.kRoundedCorner),
        ),
        child: Row(
          children: [
            ProfileItem(
              width: context.width * 0.445,
              height: 280,
              facebookFollowers: facebookFollowers,
              instagramFollowers: instagramFollowers,
              tiktokFollowers: tiktokFollowers,
              twitterFollowers: twitterFollowers,
              youTubeFollowers: youTubeFollowers,
              profileImage: profileImage,
              profileInfo: profileInfo,
              profileName: profileName,
              profileRate: profileRate,
              bottomRightRadius: 0,
              topRightRadius: 0,
            ),
            ProposalFullInfoItem(
              category: category,
              description: description,
              profileImage: profileImage,
              title: title,
              price: price,
              facebookFollowers: facebookFollowers,
              instagramFollowers: instagramFollowers,
              tiktokFollowers: tiktokFollowers,
              twitterFollowers: twitterFollowers,
              youTubeFollowers: youTubeFollowers,
            ),
          ],
        ),
      ),
    );
  }
}
