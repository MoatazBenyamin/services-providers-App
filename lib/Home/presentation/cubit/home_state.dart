part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class UpdateSelectedIndexState extends HomeState {
  final int selectedIndex;

  UpdateSelectedIndexState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
