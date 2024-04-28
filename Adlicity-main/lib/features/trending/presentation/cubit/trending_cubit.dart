import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingInitial());


  String selectedCategory = 'all';
  List<String> categories = [
    'all',
    'tech',
    'fashion',
    'finance',
    'sports',
    'news'
  ];

   void changeCategory(String category) {
    selectedCategory = category;
    emit(TrendingChangeCategory(selectedCategory));
  }

  

 

}
