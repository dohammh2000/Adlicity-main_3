import 'package:adlicity/config/themes/app_colors.dart';
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/core/utils/constants.dart';
import 'package:adlicity/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TransactionsSection extends StatelessWidget {
  WalletCubit cubit;
   TransactionsSection({
    super.key, required this.cubit
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.kPadding),
      child: ListView.separated(
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.primary,
                    child: index % 2 == 0
                        ? Image.asset(
                            IconsAssets.transUp,
                            width: 30,
                          )
                        : Image.asset(
                            IconsAssets.transDown,
                            width: 30,
                          ),
                  ),
                  title: Text(
                    'Title',
                  ),
                  titleTextStyle: TextStyle(
                    color: AppColors.primary,
                    fontFamily: AppStrings.fontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                  ),
                  subtitle: Text('subtitle'),
                  subtitleTextStyle: TextStyle(
                    color: AppColors.textColor,
                    fontFamily: AppStrings.fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       index % 2 == 0? '+ 2500 \$' : '-2500 \$',
                       style: TextStyle(
                        color: index % 2 == 0? Colors.green : Colors.red,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                       ),
                      ),
                      Text(
                     '19/2/2024',
                       style: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: AppStrings.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 8,
                       ),
                      ),
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) =>
              Divider(color: AppColors.primary),
          itemCount: 10),
    ));
  }
}


// Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 25,
//                       backgroundColor: AppColors.primary,
//                       child: index % 2 == 0? Image.asset(IconsAssets.transUp, width: 30,) : Image.asset(IconsAssets.transDown, width: 30,),
//                     ),
//                     SizedBox(width: 8,),
//                     Column(
//                       children: [
//                         Text('Title', style: TextStyle(color: AppColors.primary, fontFamily: AppStrings.fontFamily, fontWeight: FontWeight.w600),)
//                       ],
//                     )
//                   ],
//                 ),