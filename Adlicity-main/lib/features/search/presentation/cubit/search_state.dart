part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

// ignore: must_be_immutable
class SearchUpdate extends SearchState {
  String searchText;

  SearchUpdate(this.searchText);

  @override
  List<Object> get props => [searchText];
}

// ignore: must_be_immutable
class SearchSChangeCategory extends SearchState {
  String selectedCategory;

  SearchSChangeCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];
}
