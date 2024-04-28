import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/main_button.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../config/themes/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/assets_manager.dart';
import '../utils/constants.dart';
import '../utils/functions/get_rating_text.dart';

class ReportDialog extends StatefulWidget {
  final String profileName;
  final String profileImage;

  const ReportDialog(
      {super.key, required this.profileName, required this.profileImage});

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
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
            TextFormField(
              controller: TextEditingController(),
              cursorColor: AppColors.primary,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(Constants.kRoundedCorner),
                    borderSide: BorderSide(color: AppColors.primary)),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.kRoundedCorner),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(Constants.kRoundedCorner),
                  borderSide: BorderSide(color: AppColors.primary, width: 2),
                ),
              ),
              style: TextStyle(fontFamily: AppStrings.fontFamily),
              maxLines: 2,
            ),
            SizedBox(height: 22),
            MainButton(
              onPressed: () {
                Navigator.pop(context);
              },
              title: 'report',
            )
          ],
        ),
      ),
    );
  }
}
