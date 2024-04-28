part of 'trending_cubit.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

class TrendingInitial extends TrendingState {}

// ignore: must_be_immutable
class TrendingChangeCategory extends TrendingState {
  String selectedCategory;

  TrendingChangeCategory(this.selectedCategory);

  @override
  List<Object> get props => [selectedCategory];


}
