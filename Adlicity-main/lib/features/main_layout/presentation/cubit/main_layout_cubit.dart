
import 'package:adlicity/core/utils/app_strings.dart';
import 'package:adlicity/core/utils/assets_manager.dart';
import 'package:adlicity/features/add_campaign/presentation/cubit/add_campgain_cubit.dart';
import 'package:adlicity/features/add_campaign/presentation/screens/add_campgain_screen.dart';
import 'package:adlicity/features/add_proposal/presentation/cubit/add_proposal_cubit.dart';
import 'package:adlicity/features/add_proposal/presentation/screens/add_proposal_screen.dart';
import 'package:adlicity/features/home/presentation/cubit/home_cubit.dart';
import 'package:adlicity/features/home/presentation/screens/home_screen.dart';
import 'package:adlicity/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:adlicity/features/profile/presentation/screens/profile_screen.dart';
import 'package:adlicity/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:adlicity/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../campaigns/presentation/cubit/campaign_cubit.dart';
import '../../../campaigns/presentation/screens/campaigns_screen.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  int currentScreenIndex = 0;
  final zoomDrawerController = ZoomDrawerController();

  List mainScreens = [
    BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeScreen(),
    ),
    BlocProvider<CampaignCubit>(
      create: (context) => CampaignCubit(),
      child: CampaignsScreen(),
    ),
    // BlocProvider<AddCampgainCubit>(
    //   create: (context) => AddCampgainCubit(),
    //   child: AddCampgainScreen(),
    // ),
     BlocProvider<AddProposalCubit>(
      create: (context) => AddProposalCubit(),
      child: AddProposalScreen(),
    ),
    BlocProvider<WalletCubit>(
      create: (context) => WalletCubit(),
      child: WalletScreen(),
    ),
    
    BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(),
            child: ProfileScreen(
              facebookFollowers: '1.4M',
              instagramFollowers: '192.2K',
              profileImage: ImagesAssets.preson1,
              profileInfo: 'Tech Influncer from Egypt',
              profileName: 'Sherif Mahmoud',
              profileRate: 4.6,
              tiktokFollowers: '2.3M',
              twitterFollowers: '132.9K',
              youTubeFollowers: '23.6K',
            ),
          )
    // BlocProvider<AddProposalCubit>(
    //   create: (context) => AddProposalCubit(),
    //   child: AddProposalScreen(),
    // ),
  ];
  List mainScreensTitles = [
    'home',
    'campaigns',
    // 'new_campaign',
    'new_proposal',
   
    'wallet',
    'profile',
    'new_proposal',
     // 'new_proposal',
  ];

  void changeMainScreen(int index) {
    currentScreenIndex = index;
    emit(MainLayoutChangeScreenIndex(currentScreenIndex));
  }
}
