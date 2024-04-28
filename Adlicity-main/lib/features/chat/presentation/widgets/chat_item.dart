
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constants.dart';

class ChatItem extends StatelessWidget {
  final Function() tileOnTap;
  final Function() profileOnTap;
  final int index;
  final String name;
  final String lastMessage;
  final String date;
  final String profileImage;
  const ChatItem({
    super.key, required this.tileOnTap, required this.profileOnTap, required this.index, required this.name, required this.lastMessage, required this.date, required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: tileOnTap,
          child: Container(
            decoration: BoxDecoration(
              color: index % 6 == 0 ? AppColors.third : Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(Constants.kPadding),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: profileOnTap,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(profileImage),
                      radius: 25,
                    ),
                  ),
                  Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: AppStrings.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                      SizedBox(
                        width: context.width / 1.8,
                        child: Text(
                          lastMessage,
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontFamily: AppStrings.fontFamily,
                            fontWeight: FontWeight.w700,
                            fontSize: 8,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    date,
                    style: TextStyle(
                        color: index % 6 == 0
                            ? AppColors.primary
                            : AppColors.textColor,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
