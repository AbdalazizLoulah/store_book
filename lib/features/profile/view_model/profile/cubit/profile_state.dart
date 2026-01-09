part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel data;

  ProfileSuccess({required this.data});
}

final class ProfileLoading extends ProfileState {}

final class ProfileFailure extends ProfileState {
  final String errMassage;

  ProfileFailure({required this.errMassage});
}
