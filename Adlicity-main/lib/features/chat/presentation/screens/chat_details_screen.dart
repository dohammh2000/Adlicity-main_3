import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/core/utils/firebase_services.dart';
import 'package:adlicity/core/utils/media_query_values.dart';
import 'package:adlicity/core/widgets/input_field.dart';
import 'package:adlicity/core/widgets/rating_dialog.dart';
import 'package:adlicity/core/widgets/report_dialog.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adlicity/features/chat/presentation/cubit/chat_cubit.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/appbar_circle_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // User? user = FirebaseAuth.instance.currentUser;

    // if (user == null) {
    //   // If user is not authenticated, navigate to the authentication screen
      
    // }

    // String? userId = user?.uid;

    

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _appbar(context),
      body: BlocBuilder(
        bloc: ChatCubit(),
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  reverse: true,
                  itemBuilder: (_, int index) => MessageItem(
                    isSender: index % 4 == 0 ? true : false,
                    date: '9:09 AM',
                    isTail: false,
                    message: 'jkefkwkejf wefn efwne fweoijfwek foeoifjalf oejf okaefjka eoaefnaklf ',
                  ),
                  itemCount: 50,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  top: 10,
                  start: Constants.kPadding,
                  end: Constants.kPadding,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width * 0.75,
                      child: InputField(
                        controller: TextEditingController(),
                        hintText: 'type_message'.tr(),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(12),
                      onPressed: () {
                        var _textEditingController = TextEditingController();
                        final message = _textEditingController.text;
                        FirebaseService().sendMessage(message, userId!);
                      },
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(AppColors.primary),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


  // SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             width: context.width,
  //             height: context.height * 0.81,
  //             child: SingleChildScrollView(
  //               reverse: true,
  //               child: _bubbels(),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsetsDirectional.only(
  //               start: Constants.kPadding,
  //               end: Constants.kPadding,
  //               bottom: 10,
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 SizedBox(
  //                   width: context.width * 0.75,
  //                   child: InputField(
  //                     controller: TextEditingController(),
  //                     hintText: 'type_message'.tr(),
  //                   ),
  //                 ),
  //                 IconButton(
  //                   padding: EdgeInsets.all(12),
  //                   onPressed: () {},
  //                   icon: Icon(
  //                     Icons.send,
  //                     color: Colors.white,
  //                   ),
  //                   style: ButtonStyle(
  //                     backgroundColor:
  //                         MaterialStatePropertyAll(AppColors.primary),
  //                   ),
  //                 )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),

  Column _bubbels() {
    return Column(
      children: [
        BubbleSpecialThree(
          text: 'Added iMessage shape bubbles',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Please try and give some feedback on it!',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Sure',
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "I tried. It's awesome!!!",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "Thanks",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: 'Added iMessage shape bubbles',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Please try and give some feedback on it!',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Sure',
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleNormalImage(
          id: 'id001',
          image: Image.asset(ImagesAssets.preson1),
          color: AppColors.primary,
          tail: true,
        ),
        BubbleSpecialThree(
          text: "I tried. It's awesome!!!",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "Thanks",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: 'Added iMessage shape bubbles',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Please try and give some feedback on it!',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Sure',
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "I tried. It's awesome!!!",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "Thanks",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: 'Added iMessage shape bubbles',
          color: AppColors.primary,
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Please try and give some feedback on it!',
          color: AppColors.primary,
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Sure',
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        BubbleSpecialThree(
          text: "I tried. It's awesome!!!",
          color: AppColors.third,
          tail: false,
          isSender: false,
          textStyle: TextStyle(
            color: AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        DateChip(
          date: new DateTime(2021, 5, 7),
          color: Color(0x558AD3D5),
        ),
      ],
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
      centerTitle: false,
      titleSpacing: 0,
      title: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImagesAssets.preson1),
              radius: 15,
            ),
            Gap(10),
            Text(
              'Sherif Mahmoud',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontFamily: AppStrings.fontFamily,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarCircleButton(
          image: IconsAssets.starOutline,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => RateDialog(
                profileName: 'Sherif Mahmoud',
                profileImage: ImagesAssets.preson1,
              ),
            );
          },
        ),
        AppbarCircleButton(
          image: IconsAssets.reportOutline,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => ReportDialog(
                profileName: 'Sherif Mahmoud',
                profileImage: ImagesAssets.preson1,
              ),
            );
          },
        ),
        Gap(Constants.kPadding),
      ],
    );
  }


class MessageItem extends StatelessWidget {
  final bool isSender;
  final bool isTail;
  final String message;
  final String date;
  const MessageItem({
    super.key,
    required this.isSender,
    required this.isTail,
    required this.message,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isSender?  CrossAxisAlignment.end :CrossAxisAlignment.start ,
      children: [
        BubbleSpecialThree(
          text: message,
          color: isSender? AppColors.primary :AppColors.third,
          tail: isTail,
          isSender: isSender,
          textStyle: TextStyle(
            color: isSender? Colors.white:AppColors.primary,
            fontFamily: AppStrings.fontFamily,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.kPadding + 10),
          child: Text(
            date,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontFamily: AppStrings.fontFamily,
              fontSize: 7,
            ),
          ),
        ),
      ],
    );
  }
}
