part of 'main_layout_cubit.dart';

abstract class MainLayoutState extends Equatable {
  const MainLayoutState();

  @override
  List<Object> get props => [];
}

class MainLayoutInitial extends MainLayoutState {}
class MainLayoutChangeScreenIndex extends MainLayoutState {
  final int currentScreenIndex;

  MainLayoutChangeScreenIndex(this.currentScreenIndex);

  @override
  List<Object> get props => [currentScreenIndex];
}

