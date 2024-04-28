import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/assets_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  String selectedCategory = 'all';
 

  void changeCategory(String category) {
    selectedCategory = category;
    emit(HomeChangeCategory(selectedCategory));
  }

  int currentBannerIndex = 0;
  List banners = [
    ImagesAssets.logo,
    ImagesAssets.logo,
    ImagesAssets.logo,
  ];


   void changeBannerIndex(int index) {
    currentBannerIndex = index;
    emit(HomeChangeBannerIndex(currentBannerIndex));
  }

}
