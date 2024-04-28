import 'package:adlicity/config/routes/app_routes.dart';
import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/chat_item.dart';

// ignore: must_be_immutable
class ChatsScreen extends StatelessWidget {
  ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          child: ListView.separated(
              padding: EdgeInsetsDirectional.only(top: 10),
              itemBuilder: (context, index) => ChatItem(
                    date: '9:09',
                    index: index,
                    name: 'Sherif Mahmoud',
                    lastMessage: AppStrings.dumyText,
                    profileImage: ImagesAssets.preson1,
                    profileOnTap: () {},
                    tileOnTap: () {
                      Navigator.pushNamed(context, Routes.chatDetailsRoute);
                    },
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: AppColors.primary,
                    height: 1,
                    thickness: 1,
                  ),
              itemCount: 10),
        ),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(
          IconsAssets.arrowLeft,
          width: 24,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'chats'.tr(),
        style: TextStyle(fontFamily: AppStrings.fontFamily, fontSize: 20),
      ),
      centerTitle: true,
    );
  }
}
