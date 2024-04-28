import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';
import '../cubit/campaign_cubit.dart';
import 'profile_item_with_blur_buttons.dart';

class CampgainOfferingSection extends StatelessWidget {
  const CampgainOfferingSection({
    super.key,
    required this.status,
    required this.cubit,
  });

  final String status;
  final CampaignCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: status == 'offering',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Constants.kPadding,
                top: Constants.kPadding,
                right: Constants.kPadding),
            child: Text(
              'publishers'.tr(),
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppStrings.fontFamily,
                  fontSize: 15),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: Constants.usersImagesTest.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8, // Adjust the aspect ratio as needed
              mainAxisSpacing: 10.0, // Add space between rows
              crossAxisSpacing: 10.0, // Add space between columns
            ),
            itemBuilder: (context, index) => ProfileItemWithBlurButtons(
              cubit: cubit,
              index: index,
              firstButtonTitle: 'accept',
              firstButtonOnTap: () {},
              secondButtonTitle: 'reject',
              secondButtonOnTap: () {},
            ),
            padding: EdgeInsets.all(Constants.kPadding),
          ),
        ],
      ),
    );
  }
}
