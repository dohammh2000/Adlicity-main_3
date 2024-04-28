part of 'add_campgain_cubit.dart';

abstract class AddCampgainState extends Equatable {
  const AddCampgainState();

  @override
  List<Object> get props => [];
}

class AddCampgainInitial extends AddCampgainState {}
class AddCampgainUpdateActiveStep extends AddCampgainState {
   final int activeStep;

  AddCampgainUpdateActiveStep(this.activeStep);

  @override
  List<Object> get props => [activeStep];
}


// ignore: must_be_immutable
class AddCampgainChangeCategory extends AddCampgainState {
  String selectedCategory;

  AddCampgainChangeCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];


}
// ignore: must_be_immutable
class AddCampgainChangeAdGoal extends AddCampgainState {
  String selectedAdGoal;

  AddCampgainChangeAdGoal(this.selectedAdGoal);

  @override
  List<Object> get props => [selectedAdGoal];


}
// ignore: must_be_immutable
class AddCampgainChangePublishersChoiceType extends AddCampgainState {
  String type;

  AddCampgainChangePublishersChoiceType(this.type);

  @override
  List<Object> get props => [type];


}

// ignore: must_be_immutable
class AddCampgainUpdateSearch extends AddCampgainState {
  String searchText;

  AddCampgainUpdateSearch(this.searchText);

  @override
  List<Object> get props => [searchText];


}
// ignore: must_be_immutable
class AddCampgainToggleAdType extends AddCampgainState {
  final int index;
  final bool value;

  AddCampgainToggleAdType(this.index, this.value); // Correct order

  @override
  List<Object> get props => [index, value]; // Include index as well in props
}
// ignore: must_be_immutable
class AddCampgainToggleAPlatform extends AddCampgainState {
  final int index;
  final bool value;

  AddCampgainToggleAPlatform(this.index, this.value); // Correct order

  @override
  List<Object> get props => [index, value]; // Include index as well in props
}