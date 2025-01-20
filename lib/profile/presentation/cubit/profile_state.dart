part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ImageChangedState extends ProfileState{}
class getUserDataState extends ProfileState{}
class ReadUserDataState extends ProfileState{}
class saveUserState extends ProfileState{}