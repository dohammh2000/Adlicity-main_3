part of 'campaign_cubit.dart';

abstract class CampaignState extends Equatable {
  const CampaignState();

  @override
  List<Object> get props => [];
}

class CampaignInitial extends CampaignState {}


// ignore: must_be_immutable
class CampaignToggleProfileButtonsShown extends CampaignState {
  final bool profileButtonsShown;

  CampaignToggleProfileButtonsShown(this.profileButtonsShown); // Correct order

  @override
  List<Object> get props => [profileButtonsShown]; // Include index as well in props
}