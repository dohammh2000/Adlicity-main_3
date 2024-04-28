import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'campaign_state.dart';

class CampaignCubit extends Cubit<CampaignState> {
  CampaignCubit() : super(CampaignInitial());

  bool profileButtonsShown = false;

  void toggleProfileButtonsShown(bool value) {
    profileButtonsShown = value;
    emit(CampaignToggleProfileButtonsShown(profileButtonsShown));
  }
}
