import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/functions/get_ad_type_icon.dart';
import 'package:blurhash_ffi/blurhash_the_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileMiniItem extends StatelessWidget {
  final String profileImage;
  final String profileName;
  final double? radius;
  final double? fontSize;
  const ProfileMiniItem(
      {super.key,
      required this.profileImage,
      required this.profileName,
      this.radius = 15,
      this.fontSize = 6});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: radius,
          ),
          Text(
            profileName,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              fontFamily: AppStrings.fontFamily,
              
            ),
            maxLines: 1, 
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
