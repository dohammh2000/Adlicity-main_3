
import 'package:adlicity/core/widgets/main_button.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../config/themes/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import '../utils/constants.dart';
import '../utils/functions/get_rating_text.dart';

class RateDialog extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const RateDialog({super.key, required this.profileName, required this.profileImage});

  @override
  State<RateDialog> createState() => _RateDialogState();
}

class _RateDialogState extends State<RateDialog> {
  double? _rating;
  @override
  void initState() {
    super.initState();
    _rating = 0.0; // Initialize to a default value
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.kRoundedCorner),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(Constants.kPadding),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  IconsAssets.close,
                  width: 12,
                ),
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage(widget.profileImage),
              radius: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.profileName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontFamily: AppStrings.fontFamily,
              ),
            ),
            SizedBox(height: 15),
            AnimatedRatingStars(
              initialRating: 0,
              minRating: 0.0,
              maxRating: 5.0,
              filledColor: Colors.amber,
              emptyColor: AppColors.textColor,
              filledIcon: Icons.star,
              halfFilledIcon: Icons.star_half,
              emptyIcon: Icons.star_border,
              onChanged: (double rating) {
                // Handle the rating change here
                print('Rating: $rating');
                setState(() {
                  // Update state with new rating
                  _rating = rating;
                });
              },
              // displayRatingValue: true,
              interactiveTooltips: true,
              customFilledIcon: Icons.star,
              customHalfFilledIcon: Icons.star_half,
              customEmptyIcon: Icons.star_border,
              starSize: 30.0,
              animationDuration: Duration(milliseconds: 300),
              animationCurve: Curves.easeInOut,
              readOnly: false,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              getRatingText(_rating!).tr(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
                fontFamily: AppStrings.fontFamily,
              ),
            ),
            SizedBox(height: 22),
            MainButton(
              onPressed: () {
                Navigator.pop(context);

              },
              title: 'Rate ${widget.profileName.split(' ')[0]}',
            )
          ],
        ),
      ),
    );
  }
}
