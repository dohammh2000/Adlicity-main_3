import 'package:adlicity/core/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_campgain_state.dart';

class AddCampgainCubit extends Cubit<AddCampgainState> {
  AddCampgainCubit() : super(AddCampgainInitial());
  int activeStep = 0;

  void updateActiveStep(int i) {
    activeStep = i;
    emit(AddCampgainUpdateActiveStep(activeStep));
  }

  String selectedCategory = 'all';
  void changeCategory(String category) {
    selectedCategory = category;
    emit(AddCampgainChangeCategory(selectedCategory));
  }

  Map<String, bool> chosenAdTypes = {
    Constants.adTypes[0]: false,
    Constants.adTypes[1]: false,
    Constants.adTypes[2]: false,
    Constants.adTypes[3]: false,
    Constants.adTypes[4]: false,
  };

  void toggleAdType({required int index, required bool value}) {
    chosenAdTypes[Constants.adTypes[index]] = value;
    emit(AddCampgainToggleAdType(index, value));
  }

  String adGoal = Constants.adGoals[0];
  void changeAdGoal(String goal) {
    adGoal = goal;
    emit(AddCampgainChangeAdGoal(adGoal));
  }

  Map<String, bool> chosenPlatform = {
    Constants.platforms[0]: false,
    Constants.platforms[1]: false,
    Constants.platforms[2]: false,
    Constants.platforms[3]: false,
    Constants.platforms[4]: false,
  };

  void togglePlatform({required int index, required bool value}) {
    chosenPlatform[Constants.platforms[index]] = value;
    emit(AddCampgainToggleAPlatform(index, value));
  }

  String publishersChoiceType = Constants.publishersChoiceTypes[0];
  void changePublishersChoiceType(String type) {
    publishersChoiceType = type;
    emit(AddCampgainChangePublishersChoiceType(publishersChoiceType));
  }

  TextEditingController searchController = TextEditingController();

  void updateSearch(String newSearch) {
    emit(AddCampgainUpdateSearch(newSearch));
  }
}
