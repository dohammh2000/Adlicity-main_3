
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/BlurButton.dart';
import '../../../../core/widgets/profile_item.dart';
import '../../../../core/widgets/rating_dialog.dart';
import '../../../../core/widgets/report_dialog.dart';
import '../cubit/campaign_cubit.dart';

// ignore: must_be_immutable
class ProfileItemWithBlurButtons extends StatelessWidget {
  int? index;
  final String firstButtonTitle;
  final Function() firstButtonOnTap;
  final String secondButtonTitle;
  final Function()  secondButtonOnTap;
   ProfileItemWithBlurButtons({
    Key? key,
    this.index,
    required this.cubit, required this.firstButtonTitle, required this.firstButtonOnTap, required this.secondButtonTitle, required this.secondButtonOnTap,
  }) : super(key: key);

  final CampaignCubit cubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cubit.toggleProfileButtonsShown(
            !cubit.profileButtonsShown);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ProfileItem(
            facebookFollowers: '1.4M',
            instagramFollowers: '192.3K',
            tiktokFollowers: '2.3M',
            twitterFollowers: '132.9K',
            youTubeFollowers: '23.5K',
            profileImage: Constants.usersImagesTest[index!],
            profileInfo: 'Tech Influncer From Egypt',
            profileName: 'Sherif Mahmoud',
            profileRate: 4.6,
          ),
          Visibility(
            visible: cubit.profileButtonsShown == true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonBlur(
                  onTap: firstButtonOnTap,
                  title: firstButtonTitle,
                ),
                Gap(10),
                ButtonBlur(
                  onTap: secondButtonOnTap,
                  title: secondButtonTitle,
                ),
              ],
            ).animate().fade(
                duration: Duration(milliseconds: 500)),
          ),
        ],
      ),
    );
  }
}
