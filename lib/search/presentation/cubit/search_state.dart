part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class getListOfServicesState extends SearchState {}
class getListOfCompanyState extends SearchState {}
class changeSizeListState extends SearchState {}
