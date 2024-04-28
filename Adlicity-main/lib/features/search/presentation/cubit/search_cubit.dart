import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  TextEditingController searchController = TextEditingController();

  void updateSearch(String newSearch) {
    emit(SearchUpdate(newSearch));
  }

  

  String selectedCategory = 'all';
  void changeCategory(String category) {
    selectedCategory = category;
    emit(SearchSChangeCategory(selectedCategory));
  }
}
